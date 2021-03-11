import 'package:get/get.dart';
import 'package:sneakers/screens/product_screen/controllers/product_screen_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductScreenController>(() => ProductScreenController());
  }
}