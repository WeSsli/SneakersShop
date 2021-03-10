import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/screens/home_screen/views/home_view.dart';
import 'package:sneakers/screens/home_screen/views/profile_view.dart';
import 'package:sneakers/screens/home_screen/widgets/app_bar.dart';
import 'package:sneakers/screens/home_screen/widgets/navigation_bottom.dart';

import 'controllers/navigation_controller.dart';

class HomeScreen extends StatelessWidget {
  final navigationController =
      Get.put<NavigationController>(NavigationController());
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          HomeAppBar(),
          Expanded(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 42),
                  child: PageView.builder(
                    controller: navigationController.pageController,
                    itemCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, page) {
                      switch (page) {
                        case 0:
                          return HomeView();
                        case 1:
                          return ProfileView();
                        default:
                          return ProfileView();
                      }
                    },
                  ),
                ),
                NavigationBottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
