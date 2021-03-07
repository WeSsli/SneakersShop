import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/user_controller.dart';

class HomeAppBar extends StatelessWidget {
  final userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: context.mediaQuery.padding.top + 4, left: 24, right: 24),
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
                  Text(
                    userController.user.name == null
                        ? "Loading..."
                        : userController.user.name,
                    style: context.textTheme.bodyText1.copyWith(
                      fontSize: 20,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Spacer(),
              PhysicalModel(
                borderRadius: BorderRadius.circular(64),
                shadowColor: Colors.black.withOpacity(0.5),
                color: Colors.white,
                elevation: 2,
                child: Container(
                  height: 45,
                  width: 45,
                  child: Center(
                    child: SizedBox(
                      height: 25,
                      child: SvgPicture.asset("assets/icons/cart.svg"),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          PhysicalModel(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            elevation: 2,
            shadowColor: Colors.black.withOpacity(0.3),
            child: CupertinoTextField(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
              decoration: BoxDecoration(color: Colors.transparent),
              controller: TextEditingController(),
              placeholder: "Szukaj",
              placeholderStyle: context.textTheme.bodyText1.copyWith(
                fontSize: 16,
                color: Colors.black.withOpacity(0.3),
              ),
              prefix: Container(
                margin: EdgeInsets.only(left: 8, right: 16),
                child: Icon(Icons.search),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
