import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';
import 'package:sneakers/controllers/user_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController());
    Get.put<UserController>(UserController());
    Get.put<FirebaseAuth>(FirebaseAuth.instance);
  }
}