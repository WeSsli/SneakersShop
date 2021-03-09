import 'package:get/get.dart';
import 'package:sneakers/models/product.dart';
import 'package:flutter/material.dart';

class ProductController extends GetxController {
  Rx<List<ProductModel>> products = Rx<List<ProductModel>>();
  List<ProductModel> filteredProducts = List<ProductModel>();
  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    searchController.addListener(() {
      filteredProducts = products.value.where((element) => (element.name.toLowerCase().contains(searchController.text)));
    });
    }
}
