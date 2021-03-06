import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/widgets/register_progress_button.dart';
import 'package:sneakers/widgets/text_input.dart';

import 'controllers/register_controller.dart';

class RegisterScreen extends GetView<SignupController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Text(
                    "Rejestracja",
                    style: context.textTheme.bodyText1.copyWith(
                      fontSize: 38,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                TextInput(
                  label: "E-mail",
                  textEditingController: controller.emailController,
                  type: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 16,
                ),
                TextInput(
                  label: "Hasło",
                  textEditingController: controller.passwordController,
                  obscure: true,
                ),
                SizedBox(
                  height: 16,
                ),
                TextInput(
                  label: "Imię",
                  textEditingController: controller.nameController,
                ),
                SizedBox(
                  height: 16,
                ),
                TextInput(
                  label: "Nazwisko",
                  textEditingController: controller.surnameController,
                ),
                SizedBox(
                  height: 16,
                ),
                TextInput(
                  label: "Adres",
                  textEditingController: controller.addressController,
                ),
                SizedBox(
                  height: 16,
                ),
                TextInput(
                  label: "Miejscowość",
                  textEditingController: controller.cityController,
                  action: TextInputAction.done,
                ),
                SizedBox(
                  height: 48,
                ),
                RegisterProgressButton(text: "Zarejestruj"),
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


  Widget _footer(BuildContext context) => Container(
        margin: EdgeInsets.only(bottom: 28),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Masz już konto?",
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
                "Zaloguj się",
                style: context.textTheme.bodyText1.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: context.theme.primaryColor,
                ),
              ),
              onPressed: () {
                Get.back();
              },
              padding: EdgeInsets.zero,
              minSize: 0,
              color: Colors.transparent,
            ),
          ],
        ),
      );
}
