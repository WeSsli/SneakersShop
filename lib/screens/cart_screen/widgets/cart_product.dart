import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/models/cart_product.dart';
import 'package:sneakers/screens/cart_screen/controllers/cart_controller.dart';

class CartProduct extends StatelessWidget {
  final ProductCartModel cartProduct;
  final int index;

  CartProduct({Key key, this.cartProduct, this.index}) : super(key: key);
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 24.0, right: 24, top: 12, bottom: 12),
      child: Stack(
        overflow: Overflow.visible,
        children: [
          PhysicalModel(
            color: Colors.white,
            elevation: 5,
            shadowColor: Colors.black38,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: context.mediaQuery.size.width,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: Container(
                margin: EdgeInsets.only(right: 24),
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: context.theme.cardColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Transform.rotate(
                        angle: 6.0,
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Image(
                            image: CachedNetworkImageProvider(
                              cartProduct.product.images[0],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Container(
                      child: Expanded(
                        child: Container(
                          margin:
                              EdgeInsets.only(top: 10, right: 30, bottom: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cartProduct.product.name,
                                style: context.textTheme.bodyText1.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Text(
                                "Rozmiar: ${cartProduct.size}",
                                style: context.textTheme.bodyText1.copyWith(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                "${cartProduct.product.price} zł",
                                style: context.textTheme.bodyText1.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        Get.bottomSheet(
                          Container(
                            height: 250,
                            width: context.mediaQuery.size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(28),
                                    topLeft: Radius.circular(28))),
                            child: Column(
                              children: [
                                SizedBox(height: 24),
                                Text(
                                  "Ilość: ",
                                  style: context.textTheme.bodyText1.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 150.0),
                                  child: CupertinoPicker(
                                      itemExtent: 50,
                                      onSelectedItemChanged: (int i) {
                                        cartController.addPickerPrice(i, index);
                                      },
                                      scrollController:
                                          FixedExtentScrollController(
                                        initialItem: cartController.cartList
                                                .value[index].quantity -
                                            1,
                                      ),
                                      children: List.generate(
                                        20,
                                        (index) => Center(
                                          child: Text(
                                            (index + 1).toString(),
                                          ),
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(64),
                          color: context.theme.primaryColor,
                        ),
                        child: Center(
                          child: FittedBox(
                            child: Obx(
                              () => Text(
                                "x ${cartController.cartList.value[index].quantity}",
                                style: context.textTheme.bodyText1.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 365,
            bottom: 95,
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(64),
              shadowColor: Colors.black.withOpacity(0.5),
              color: Colors.white,
              elevation: 2,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.find<CartController>().removeFromCart(index);
                },
                child: Icon(
                  Icons.clear,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
