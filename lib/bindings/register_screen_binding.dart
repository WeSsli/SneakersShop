import 'package:get/get.dart';
import 'package:sneakers/screens/register_screen/controllers/register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}