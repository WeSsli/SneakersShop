import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/screens/cart_screen/controllers/cart_controller.dart';

class OrderDialog extends StatelessWidget {
  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Twoje zamówienie zostało przyjęte do realizacji",
                style: context.textTheme.bodyText1.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Dziękujemy za złożenie zamówienia, szczegóły zostały wysłane na Twojego maila",
                style: context.textTheme.bodyText1.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              CupertinoButton(
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: context.theme.primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Center(
                      child: Text(
                        "Okej",
                        style: context.textTheme.bodyText1.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                ),
                onPressed: () async {
                  Get.back();
                },
                minSize: 0,
                padding: EdgeInsets.zero,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
