import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/screens/home_screen/controllers/navigation_controller.dart';

class NavigationBottom extends StatelessWidget {
  final NavigationController navigationController = Get.find<NavigationController>();
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: PhysicalModel(
        color: Colors.white,
        elevation: 14,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _navigationButton(
                  context, "assets/icons/HomeSelected.svg", "Strona główna", 0),
              _navigationButton(
                  context, "assets/icons/UserSelected.svg", "Profil", 1),
            ],
          ),
        ),
      ),
    );
  }
  Widget _navigationButton(
        BuildContext context, String icon, String name, int page) =>
    Obx(
      () => CupertinoButton(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                icon,
                color: page == navigationController.pageIndex.value
                    ? Colors.black
                    : Colors.grey,
                width: 20,
                height: 20,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                name,
                style: context.textTheme.bodyText1.copyWith(
                  color:
                      page == navigationController.pageIndex.value
                          ? Colors.black
                          : Colors.grey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          onPressed: () async {
            await navigationController.setPage(page);
          }),
    );

}

