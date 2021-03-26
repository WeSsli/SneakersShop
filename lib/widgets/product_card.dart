import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/models/product.dart';
import 'package:flutter/cupertino.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 24.0, right: 24, top: 12, bottom: 12),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 5,
        shadowColor: Colors.black38,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: context.mediaQuery.size.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(30),
                    height: 200,
                    decoration: BoxDecoration(
                      color: context.theme.cardColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Transform.rotate(
                      angle: 6.0,
                      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Hero(
                          tag: product.name,
                          child: Image(
                            image: CachedNetworkImageProvider(
                              product.images[0],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Expanded(
                    child: Container(
                      margin: EdgeInsets.only(top: 30, right: 30, bottom: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: context.textTheme.bodyText1.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "${product.price} zł",
                            style: context.textTheme.bodyText1.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Spacer(),
                          _viewButton(context),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _viewButton(BuildContext context) => CupertinoButton(
        child: Container(
          width: context.mediaQuery.size.width,
          decoration: BoxDecoration(
            color: context.theme.primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Center(
              child: Text(
                "Zobacz",
                style: context.textTheme.bodyText1.copyWith(
                  fontSize: 16,
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
        onPressed: () {
          Get.toNamed('product', arguments: product);
        },
      );
}
