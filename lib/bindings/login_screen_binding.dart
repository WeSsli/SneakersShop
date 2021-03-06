import 'package:get/get.dart';
import 'package:sneakers/screens/login_screen/controllers/log_in_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}