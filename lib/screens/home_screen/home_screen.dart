import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/widgets/app_bar.dart';

import 'controllers/navigation_controller.dart';

class HomeScreen extends StatelessWidget {
  final navigationController =
      Get.put<NavigationController>(NavigationController());
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: PreferredSize(
        preferredSize: Size(context.mediaQuery.size.width, 130),
        child: HomeAppBar(),
      ),
      body: Stack(
        children: [
          SafeArea(
            bottom: true,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 42),
              child: PageView.builder(
                controller: navigationController.pageController,
                itemCount: 2,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, page) {
                  switch (page) {
                    case 0:
                      return Container(
                        color: Colors.red,
                        child: Center(
                          child: Text("Ekran 1"),
                        ),
                      );
                    case 1:
                      return Container(
                        color: Colors.blue,
                        child: Center(
                          child: Text("Ekran 2"),
                        ),
                      );
                    default:
                      return Container(
                        color: Colors.red,
                        child: Center(
                          child: Text("Ekran 1"),
                        ),
                      );
                  }
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    offset: Offset(0, -3),
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: EdgeInsets.only(
                top: 8,
                bottom: Get.mediaQuery.viewPadding.bottom + 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _navigationButton(
                      context, "assets/icons/HomeSelected.svg", 0),
                  _navigationButton(
                      context, "assets/icons/UserSelected.svg", 1),

                  //SvgPicture.asset('assets/images/LoginImage.svg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _navigationButton(BuildContext context, String icon, int page) =>
    Obx(() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: CupertinoButton(
          child: SvgPicture.asset(
            icon,
            color: page == Get.find<NavigationController>().pageIndex.value
                ? Colors.black
                : Colors.grey,
            width: 20,
            height: 20,
          ),
          onPressed: () async {
            await Get.find<NavigationController>().setPage(page);
          }),
    ));
