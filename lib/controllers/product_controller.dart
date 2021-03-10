import 'package:get/get.dart';
import 'package:sneakers/models/product.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> products = Rx<List<ProductModel>>();
  Rx<List<ProductModel>> filteredProducts = Rx<List<ProductModel>>();
  final TextEditingController searchController = TextEditingController();
  RxInt type = 3.obs;

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      filterProducts();
    });
  }

  filterProducts() {
    if (type.value == 3) {
      if (searchController.text.isNotEmpty) {
        // print(searchController.text);
        filteredProducts.value = products.value
            .where((element) => (element.name
                .toLowerCase()
                .contains(searchController.text.toLowerCase())))
            .toList();
      } else {
        filteredProducts.value = List.from(products.value);
      }
    } else {
      if (searchController.text.isNotEmpty) {
        // print(searchController.text);
        filteredProducts.value = products.value
            .where((element) => (element.name
                    .toLowerCase()
                    .contains(searchController.text.toLowerCase()) &&
                element.type == type.value))
            .toList();
      } else {
        filteredProducts.value = products.value.where((element) => element.type == type.value).toList();
      }
    }
  }
}
