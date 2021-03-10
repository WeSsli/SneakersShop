import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:sneakers/screens/home_screen/widgets/profile_input.dart';
import 'package:flutter/scheduler.dart';
import 'package:sneakers/services/database.dart';

class ProfileView extends StatefulWidget {
  @override
  _ProfileViewState createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView>
    with AutomaticKeepAliveClientMixin {
  final UserController userController = Get.find<UserController>();
  final database = Database();

  @override
  void initState() {
    super.initState();
    //SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {};}
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      userController.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: Obx(
        () => Column(
          children: [
            ProfileInput(
              textEditingController: userController.nameController,
              path: 'assets/icons/user.svg',
              enabled: userController.enabled.value,
            ),
            SizedBox(height: 16),
            ProfileInput(
              textEditingController: userController.surnameController,
              path: 'assets/icons/user.svg',
              enabled: userController.enabled.value,
            ),
            SizedBox(height: 16),
            ProfileInput(
              textEditingController: userController.addressController,
              path: 'assets/icons/id-card.svg',
              enabled: userController.enabled.value,
            ),
            SizedBox(height: 16),
            ProfileInput(
              textEditingController: userController.cityController,
              path: 'assets/icons/id-card.svg',
              enabled: userController.enabled.value,
            ),
            Spacer(),
            Obx(
              () => Container(
                child: userController.enabled.value
                    ? CupertinoButton(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 64, vertical: 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: context.theme.primaryColor,
                          ),
                          child: Text(
                            "Zapisz",
                            style: context.textTheme.bodyText1.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () async {
                          await database.updateUser(userController.user.id);
                          userController.enabled.value = false;
                          userController.user = await database.getUser(userController.user.id);
                        },
                        padding: EdgeInsets.zero,
                        minSize: 0,
                        color: Colors.transparent,
                      )
                    : SizedBox(height: 0),
              ),
            ),
            SizedBox(
              height: 64,
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
