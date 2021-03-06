import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/screens/home_screen/home_screen.dart';
import 'package:sneakers/screens/login_screen/login_screen.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return GetX(
      initState: (_) {
        Get.put<UserController>(UserController());
      },
      builder: (_) {
        
      },
    );
  }
}
