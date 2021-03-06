import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';

class HomeScreen extends StatelessWidget {
  final AuthController c = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("homescreen"),
            FlatButton(
              onPressed: () {
                c.signOut();
              },
              child: Text(
                "Wyloguj",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
