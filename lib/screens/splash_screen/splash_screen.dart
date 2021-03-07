import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sneakers/controllers/auth_controller.dart';
import 'package:sneakers/utils/precache_image.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async { 
      await PrecacheImages().init(context);
      Get.find<AuthController>().init();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              child: SvgPicture.asset('assets/images/logo.svg'),
              height: 200,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(context.theme.primaryColor),
            ),
            
          ],
        ),
      ),
    );
  }
}
