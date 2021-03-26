import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';

class SignupController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();

  bool emailError = true;
  bool passwordError = true;
  bool nameError = true;
  bool surnameError = true;
  bool addressError = true;
  bool cityError = true;

//TODO poprawic walidacje
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

    nameController.addListener(() {
      if (nameController.text.isEmpty) {
        nameError = true;
      } else
        nameError = false;
    });

    surnameController.addListener(() {
      if (surnameController.text.isEmpty) {
        surnameError = true;
      } else
        surnameError = false;
    });

    addressController.addListener(() {
      if (addressController.text.isEmpty) {
        addressError = true;
      } else
        addressError = false;
    });

    cityController.addListener(() {
      if (cityController.text.isEmpty) {
        cityError = true;
      } else
        cityError = false;
    });
  }

  Future<bool> signUp() async {
    if (!emailError &&
        !passwordError &&
        !nameError &&
        !surnameError &&
        !addressError &&
        !cityError) {
      return await Get.find<AuthController>()
          .createUser(
        nameController.text,
        emailController.text,
        passwordController.text,
        surnameController.text,
        addressController.text,
        cityController.text,
      )
          .then((b) {
        emailController.clear();
        passwordController.clear();
        nameController.clear();
        surnameController.clear();
        addressController.clear();
        cityController.clear();
        return b;
      });
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        message: "Nie udało się zarejestrować",
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(24),
        borderRadius: 12,
      );
      return false;
    }
  }

  /*Future<bool> signIn() async {
    if (!emailError && !passwordError) {
      return await c
          .logIn(emailController.text, passwordController.text)
          .then((b) {
        passwordController.clear();
        return b;
      });
    } else {
      Get.rawSnackbar(
        backgroundColor: Colors.red,
        message: "Nie udało się zalogować",
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(24),
        borderRadius: 12,
      );
      return false;
    }
  }*/
}
