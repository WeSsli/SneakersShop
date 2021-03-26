import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/screens/cart_screen/widgets/cart_product.dart';
import 'package:sneakers/services/database.dart';
import 'package:sneakers/widgets/circular_reveal.dart';
import 'package:sneakers/widgets/order_dialog.dart';

import 'controllers/cart_controller.dart';

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                top: context.mediaQuery.padding.top + 8, left: 24),
            child: PhysicalModel(
              borderRadius: BorderRadius.circular(64),
              shadowColor: Colors.black.withOpacity(0.5),
              color: Colors.white,
              elevation: 2,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Get.back();
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 4,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/arrow_back.svg",
                    height: 25,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40.0),
            child: Text(
              "Koszyk",
              style: context.textTheme.bodyText1.copyWith(
                fontSize: 40,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Obx(
              () => cartController.cartList.value.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Obx(
                            () => ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: cartController.cartList.value.length,
                                itemBuilder: (context, index) {
                                  return CartProduct(
                                    cartProduct:
                                        cartController.cartList.value[index],
                                    index: index,
                                  );
                                }),
                          ),
                        ),
                        SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Obx(
                            () => Text(
                              "Łączna kwota: ${cartController.sumPrice.value} zł",
                              style: context.textTheme.bodyText1.copyWith(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        /*CupertinoButton(
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 24),
                            width: context.mediaQuery.size.width,
                            decoration: BoxDecoration(
                              color: context.theme.primaryColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 22),
                              child: Center(
                                child: Text(
                                  "Złóż zamówienie",
                                  style: context.textTheme.bodyText1.copyWith(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          minSize: 0,
                          color: Colors.transparent,
                          padding: EdgeInsets.zero,
                          onPressed: () async {
                            if (await Database().order()) {
                              Get.dialog(OrderDialog());
                            }
                          },
                        ),*/
                        CircularReveal(),
                        SizedBox(
                          height: 24,
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          SizedBox(
                            child:
                                SvgPicture.asset('assets/images/EmptyCart.svg'),
                            height: 250,
                          ),
                          SizedBox(
                            height: 48,
                          ),
                          Text(
                            "Koszyk jest pusty",
                            style: context.textTheme.bodyText1.copyWith(
                              fontSize: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
