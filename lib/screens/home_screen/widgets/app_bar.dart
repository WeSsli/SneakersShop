import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:sneakers/screens/home_screen/controllers/navigation_controller.dart';

class HomeAppBar extends StatelessWidget {
  final UserController userController = Get.find<UserController>();
  final NavigationController navigationController =
      Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        width: context.mediaQuery.size.width,
        padding: EdgeInsets.only(
          top: context.mediaQuery.padding.top + 8,
          left: 24,
          right: 24,
          bottom: 24,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dzień dobry,",
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Obx(
                      () => Text(
                        userController.user.name == null
                            ? "Loading..."
                            : userController.user.name,
                        style: context.textTheme.bodyText1.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
                PhysicalModel(
                  borderRadius: BorderRadius.circular(64),
                  shadowColor: Colors.black.withOpacity(0.5),
                  color: navigationController.pageIndex.value == 1 &&
                          userController.enabled.value
                      ? context.theme.primaryColor
                      : Colors.white,
                  elevation: 2,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      if (navigationController.pageIndex.value == 1) {
                        if(userController.enabled.value) {
                          userController.enabled.value = false;
                        }
                        else {
                          userController.enabled.value = true;
                        }
                      }
                      else{
                        Get.toNamed("cart");
                      }
                    },
                    child: navigationController.pageIndex.value == 0
                        ? SvgPicture.asset(
                            "assets/icons/cart.svg",
                            height: 25,
                          )
                        : SvgPicture.asset(
                            "assets/icons/Edit.svg",
                            color: navigationController.pageIndex.value == 1 &&
                                    userController.enabled.value
                                ? Colors.white
                                : Colors.black,
                            height: 20,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
