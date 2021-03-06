import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/widgets/text_input.dart';

import 'controllers/register_controller.dart';

class RegisterScreen extends StatelessWidget {

  final signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                textEditingController: signupController.emailController,
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 16,
              ),
              TextInput(
                label: "Hasło",
                textEditingController: signupController.passwordController,
                obscure: true,
              ),
              SizedBox(
                height: 16,
              ),
              TextInput(
                label: "Imię",
                textEditingController: signupController.nameController,
              ),
              SizedBox(
                height: 16,
              ),
              TextInput(
                label: "Nazwisko",
                textEditingController: signupController.surnameController,
              ),
              SizedBox(
                height: 16,
              ),
              TextInput(
                label: "Adres",
                textEditingController: signupController.addressController,
              ),
              SizedBox(
                height: 16,
              ),
              TextInput(
                label: "Miejscowość",
                textEditingController: signupController.cityController,
              ),
              SizedBox(
                height: 48,
              ),
              CupertinoButton(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  width: context.mediaQuery.size.width,
                  decoration: BoxDecoration(
                    color: context.theme.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 22),
                    child: Center(
                      child: Text(
                        "Zarejestruj",
                        style: context.textTheme.bodyText1.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                minSize: 0,
                color: Colors.transparent,
                padding: EdgeInsets.zero,
                onPressed: () {
                  signupController.signUp();
                },
              ),
              SizedBox(
                height: 28,
              ),
              Container(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
