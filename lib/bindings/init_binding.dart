import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';
import 'package:sneakers/controllers/product_controller.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/screens/cart_screen/controllers/cart_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(UserController());
    Get.put<CartController>(CartController());
    Get.put<AuthController>(AuthController());
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
    Get.put<ProductController>(ProductController());
  }
}