import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';

class SigninController extends GetxController {
  final AuthController c = Get.find();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool emailError = false;
  bool passwordError = false;

  @override
  void onInit() {
    super.onInit();
    emailController.addListener(() {
      if (!emailController.text.isEmail) {
        emailError = true;
      } else
        emailError = false;
    });

    passwordController.addListener(() {
      if (passwordController.text.isEmpty) {
        passwordError = true;
      } else
        passwordError = false;
    });
  }

  void signIn() {
    if (!emailError && !passwordError) {
      c.logIn(emailController.text, passwordController.text);
    }
  }
}
