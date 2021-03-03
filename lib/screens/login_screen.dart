import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              child: SizedBox(
                child: SvgPicture.asset('assets/images/LoginImage.svg'),
                height: 200,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              "Logowanie",
              style: GoogleFonts.quicksand(
                fontSize: 38,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
