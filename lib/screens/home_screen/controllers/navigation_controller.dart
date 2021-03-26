import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class NavigationController extends GetxController {
  var pageIndex = 0.obs;

  PageController pageController =
      PageController(initialPage: 0, keepPage: true);

  Future setPage(int index) async {
    if (pageController != null) {
      await pageController.animateToPage(
        index,
        duration: Duration(milliseconds: 375),
        curve: Curves.easeInOut,
      );

      pageIndex.value = index;
    }
  }
}