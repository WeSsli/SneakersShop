import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';

class SigninController extends GetxController {
  final AuthController c = Get.find<AuthController>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool emailError = true;
  bool passwordError = true;

  //TODO Poprawic walidacje
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

  Future<bool> signIn() async {
    {
      if (!emailError && !passwordError) {
        try {
          await c.logIn(emailController.text, passwordController.text);
          return true;
        } catch (e) {
          return false;
        } finally {
          emailController.clear();
          passwordController.clear();
        }
      } else {
        Get.rawSnackbar(
          backgroundColor: Colors.red,
          message: "Nie udało się zalogować",
          snackPosition: SnackPosition.BOTTOM,
        );
        return false;
      }
    }
  }
}
