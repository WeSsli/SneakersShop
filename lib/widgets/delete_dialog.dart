import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';
import 'package:sneakers/screens/home_screen/widgets/profile_input.dart';

class DeleteDialog extends StatelessWidget {
  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: PageView.builder(
          controller: authController.deleteDialogController,
          itemCount: 2,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, page) {
            switch (page) {
              case 0:
                return _firstDialog(context);
              case 1:
                return _secondDialog(context);
              default:
                return _firstDialog(context);
            }
          },
        ),
      ),
    );
  }

  Widget _firstDialog(BuildContext context) => Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    "Usuwanie konta",
                    style: context.textTheme.bodyText1.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Czy na pewno chcesz usunąć konto?",
                    style: context.textTheme.bodyText1.copyWith(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton(
                    child: Text(
                      "Tak",
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    minSize: 0,
                    padding: EdgeInsets.all(12),
                    color: Colors.transparent,
                    onPressed: () {
                      authController.setPage(1);
                    },
                  ),
                  CupertinoButton(
                    child: Text(
                      "Nie",
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    minSize: 0,
                    padding: EdgeInsets.all(12),
                    color: Colors.transparent,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );

  Widget _secondDialog(BuildContext context) => Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  Text(
                    "Potwierdź",
                    style: context.textTheme.bodyText1.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  ProfileInput(
                    textEditingController: authController.dialogEmailController,
                    path: 'assets/icons/mention.svg',
                    enabled: true,
                    color: Colors.grey[200],
                    placeholder: "E-mail",
                    type: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  ProfileInput(
                    textEditingController: authController.dialogPasswordController,
                    path: 'assets/icons/id-card.svg',
                    enabled: true,
                    color: Colors.grey[200],
                    placeholder: "Hasło",
                    obscure: true,
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CupertinoButton(
                    child: Text(
                      "Usuń",
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    minSize: 0,
                    padding: EdgeInsets.all(12),
                    color: Colors.transparent,
                    onPressed: () {
                      Get.back();
                      Get.find<AuthController>().deleteUser();
                    },
                  ),
                  CupertinoButton(
                    child: Text(
                      "Anuluj",
                      style: context.textTheme.bodyText1.copyWith(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    minSize: 0,
                    padding: EdgeInsets.all(12),
                    color: Colors.transparent,
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
