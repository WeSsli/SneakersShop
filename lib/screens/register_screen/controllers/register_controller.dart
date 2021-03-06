import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';

class SignupController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();

  bool emailError = false;
  bool passwordError = false;
  bool nameError = false;
  bool surnameError = false;
  bool addressError = false;
  bool cityError = false;

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

  void signUp() {
    if (!emailError &&
        !passwordError &&
        !nameError &&
        !surnameError &&
        !addressError &&
        !cityError) {
      Get.find<AuthController>().createUser(
        nameController.text,
        emailController.text,
        passwordController.text,
        surnameController.text,
        addressController.text,
        cityController.text,
      );
    }
  }
}
