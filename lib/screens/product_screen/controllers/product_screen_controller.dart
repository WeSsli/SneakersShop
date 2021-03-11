import 'package:get/get.dart';
import 'package:sneakers/models/product.dart';

class ProductScreenController extends GetxController{
  RxString size = "0".obs;
  RxInt pageIndex = 0.obs;
 
  final Rx<ProductModel> product = Rx<ProductModel>();

  @override
  void onInit() {
    super.onInit();
    product.value = Get.arguments;
  }
}