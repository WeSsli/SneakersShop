import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/services/database.dart';

class SplashController extends GetxController {
  
  void init() {
    Get.find<FirebaseAuth>().authStateChanges().listen((event) async {
      if (event != null) {
        Get.find<UserController>().user =
            await Database().getUser(event.uid);
        Get.offNamed("home");
      } else {
        Get.offNamed("login");
      }
    });
  }
}
