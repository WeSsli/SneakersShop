import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/screens/cart_screen/controllers/cart_controller.dart';
import 'package:sneakers/screens/product_screen/controllers/product_screen_controller.dart';
import 'package:sneakers/widgets/cart_button.dart';

class ProductScreen extends StatelessWidget {
  final ProductScreenController productScreenController =
      Get.find<ProductScreenController>();

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _carousel(context),
        Expanded(
          child: PhysicalModel(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            elevation: 20,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 24, right: 24),
                    child: Text(
                      productScreenController.product.value.name,
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      productScreenController.product.value.price + " zł",
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      productScreenController.product.value.description,
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      "Dostępne rozmiary",
                      style: context.textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.w800,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  _sizeList(context),
                  SizedBox(
                    height: 24,
                  ),
                  _addToCartButton(context),
                  SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _carousel(BuildContext context) => Stack(
        children: [
          Hero(
            tag: productScreenController.product.value.name,
            child: CarouselSlider(
              options: CarouselOptions(
                autoPlay: false,
                height: 260,
                initialPage: 0,
                enableInfiniteScroll: true,
                scrollDirection: Axis.horizontal,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  productScreenController.pageIndex.value = index;
                },
              ),
              items: [0, 1].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Image(
                      image: CachedNetworkImageProvider(
                        productScreenController.product.value.images[i],
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 25,
            child: Container(
              height: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    productScreenController.product.value.images.map((url) {
                  int index =
                      productScreenController.product.value.images.indexOf(url);
                  return Obx(
                    () => Container(
                      margin: EdgeInsets.symmetric(horizontal: 4),
                      width: 20,
                      decoration: BoxDecoration(
                        color: productScreenController.pageIndex.value == index
                            ? context.theme.primaryColor
                            : context.theme.primaryColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          Positioned(
            top: context.mediaQuery.padding.top + 8,
            right: 24,
            child: CartButton(),
          ),
          Positioned(
            top: context.mediaQuery.padding.top + 8,
            left: 24,
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
        ],
      );

  Widget _sizeList(BuildContext context) => Container(
        height: 50,
        child: ListView.builder(
            padding: EdgeInsets.only(left: 24),
            scrollDirection: Axis.horizontal,
            itemCount: productScreenController.product.value.sizes.length,
            itemBuilder: (context, index) {
              return Obx(
                () => Row(
                  children: [
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      minSize: 0,
                      color: Colors.transparent,
                      onPressed: () {
                        productScreenController.size.value =
                            productScreenController.product.value.sizes[index];
                      },
                      child: Container(
                        height: 60,
                        width: 70,
                        decoration: BoxDecoration(
                          color: productScreenController.size.value ==
                                  productScreenController
                                      .product.value.sizes[index]
                              ? context.theme.primaryColor
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: context.theme.primaryColor),
                        ),
                        child: Center(
                          child: Text(
                            productScreenController.product.value.sizes[index],
                            style: productScreenController.size.value ==
                                    productScreenController
                                        .product.value.sizes[index]
                                ? context.textTheme.bodyText1.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  )
                                : context.textTheme.bodyText1.copyWith(
                                    fontSize: 20,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ],
                ),
              );
            }),
      );

  Widget _addToCartButton(BuildContext context) => CupertinoButton(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          width: context.mediaQuery.size.width,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 22),
            child: Center(
              child: Text(
                "Dodaj do koszyka",
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
          if (await cartController.addToCart(
              productScreenController.product.value,
              productScreenController.size.value)) {
            productScreenController.animationController.forward().then(
                  (value) =>
                      productScreenController.animationController.reverse(),
                );
          }
        },
      );
}
