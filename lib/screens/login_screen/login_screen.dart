import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/widgets/login_progress_button.dart';
import 'package:sneakers/widgets/text_input.dart';

import 'controllers/log_in_controller.dart';

class LoginScreen extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: context.mediaQuery.padding.top + 4,
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: SizedBox(
                    child: SvgPicture.asset('assets/images/LoginImage.svg'),
                  ),
                  height: 200,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Logowanie",
                  style: context.textTheme.bodyText1.copyWith(
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                TextInput(
                  label: "E-mail",
                  textEditingController: controller.emailController,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 24,
                ),
                TextInput(
                  label: "Hasło",
                  textEditingController: controller.passwordController,
                  obscure: true,
                  action: TextInputAction.done,
                ),
                SizedBox(
                  height: 64,
                ),
                ProgressButton(
                  text: "Zaloguj",
                ),
                SizedBox(
                  height: 28,
                ),
                _footer(context),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget _footer(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Nie masz konta?",
            style: context.textTheme.bodyText1.copyWith(
              fontSize: 16,
              color: context.theme.primaryColor,
            ),
          ),
          SizedBox(
            width: 4,
          ),
          CupertinoButton(
            child: Text(
              "Zarejestruj się",
              style: context.textTheme.bodyText1.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w800,
                color: context.theme.primaryColor,
              ),
            ),
            onPressed: () {
              Get.toNamed("register");
              controller.emailController.clear();
              controller.passwordController.clear();
            },
            padding: EdgeInsets.zero,
            minSize: 0,
            color: Colors.transparent,
          ),
        ],
      );
}
