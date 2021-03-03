import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                textEditingController: TextEditingController(),
                type: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 24,
              ),
              TextInput(
                label: "Hasło",
                textEditingController: TextEditingController(),
                obscure: true,
              ),
              SizedBox(
                height: 64,
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
                        "Zaloguj",
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
                onPressed: () {},
              ),
              SizedBox(
                height: 28,
              ),
              Row(
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
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    minSize: 0,
                    color: Colors.transparent,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
