import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';
import 'package:sneakers/controllers/product_controller.dart';
import 'package:sneakers/models/product.dart';
import 'package:sneakers/services/database.dart';
import 'package:sneakers/utils/precache_image.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ProductController productController = Get.find<ProductController>();
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await PrecacheImages().init(context);
      Get.find<AuthController>().init();
      productController.products.value = await Database().getProducts();
      for (ProductModel p in productController.products.value) {
        CachedNetworkImageProvider(p.images[0]);
        CachedNetworkImageProvider(p.images[1]);
      }
      await Future.delayed(Duration(seconds: 1));
      productController.filteredProducts = productController.products.value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: SvgPicture.asset('assets/images/logo.svg'),
              height: 200,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(context.theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
