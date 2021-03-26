import 'package:get/get.dart';
import 'package:sneakers/models/cart_product.dart';
import 'package:sneakers/models/product.dart';
import 'package:flutter/material.dart';

class CartController extends GetxController {
  Rx<List<ProductCartModel>> cartList = Rx<List<ProductCartModel>>();
  RxInt sumPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    cartList.value = List<ProductCartModel>();
  }

  void addToCart(ProductModel product, String size) {
    ProductCartModel tempProduct =
        ProductCartModel(product: product, size: size, quantity: 1);

    bool isIn = false;

    /*if (cartList.value.contains(tempProduct)) {
      print("Jest");
      int index = cartList.value.indexOf(tempProduct);
      cartList.value[index].amount++;
    } else {
      print("Nie ma");
      cartList.value.add(tempProduct);
    }*/

    if (tempProduct.size != "0") {
      if (cartList.value.isEmpty) {
        cartList.value.add(tempProduct);
        sumPrice.value += int.parse(tempProduct.product.price);
      } else {
        for (ProductCartModel p in cartList.value) {
          if (p.product == tempProduct.product && p.size == tempProduct.size) {
            p.quantity++;
            sumPrice.value += int.parse(tempProduct.product.price);
            isIn = true;
          }
        }
        if (!isIn) {
          cartList.value.add(tempProduct);
          sumPrice.value += int.parse(tempProduct.product.price);
        }
      }
    } else {
      Get.rawSnackbar(
          backgroundColor: Colors.red,
          message: "Proszę wybrać rozmiar",
          snackPosition: SnackPosition.BOTTOM);
    }

    /*
    for (ProductCartModel p in cartList.value) {
      print(p.product.name + " " + p.size + " " + p.quantity.toString());
    }
    print("-----------------------");
    */
  }

  void removeFromCart(int index) {
    sumPrice.value -= int.parse(cartList.value[index].product.price) *
        cartList.value[index].quantity;
    cartList.value.removeAt(index);
    cartList.refresh();
  }

  void addPickerPrice(int i, int index) {
    int initQuantity = cartList.value[index].quantity;
    cartList.value[index].quantity = ++i;

    sumPrice.value += (cartList.value[index].quantity - initQuantity) *
        int.parse(cartList.value[index].product.price);
    cartList.refresh();
  }

  Future<void> clearCart() async {
    cartList.value.clear();
    cartList.refresh();
    sumPrice.value = 0;
  }
}
