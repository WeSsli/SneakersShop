import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sneakers/bindings/init_binding.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sneakers/bindings/login_screen_binding.dart';
import 'package:sneakers/bindings/product_screen_binding.dart';
import 'package:sneakers/bindings/register_screen_binding.dart';
import 'package:sneakers/screens/cart_screen/cart_screen.dart';
import 'package:sneakers/screens/home_screen/home_screen.dart';
import 'package:sneakers/screens/login_screen/login_screen.dart';
import 'package:sneakers/screens/product_screen/product_screen.dart';
import 'package:sneakers/screens/register_screen/register_screen.dart';
import 'package:sneakers/screens/splash_screen/splash_screen.dart';
import 'package:sneakers/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        initialBinding: InitBinding(),
        theme: AppTheme.light,
        debugShowCheckedModeBanner: false,
        builder: (context, widget) {
          return ResponsiveWrapper.builder(
            BouncingScrollWrapper.builder(context, widget),
            maxWidth: 1200,
            minWidth: 450,
            defaultScale: true,
            breakpoints: [
              ResponsiveBreakpoint.resize(450, name: MOBILE),
              ResponsiveBreakpoint.autoScale(800, name: TABLET),
              ResponsiveBreakpoint.autoScale(1000, name: TABLET),
              ResponsiveBreakpoint.resize(1200, name: DESKTOP),
              ResponsiveBreakpoint.autoScale(2460, name: "4K"),
            ],
          );
        },
        getPages: [
          GetPage(
            name: '/',
            page: () => SplashScreen(),
        
          ),
          GetPage(
            name: 'login',
            page: () => LoginScreen(),
            binding: LoginBinding(),
          ),
          GetPage(
            name: 'register',
            page: () => RegisterScreen(),
            binding: RegisterBinding(),
          ),
          GetPage(
            name: 'home',
            page: () => HomeScreen(),
          ),
          GetPage(
            name: 'product',
            page: () => ProductScreen(),
            binding: ProductBinding(),
          ),
          GetPage(
            name: "cart",
            page: () => CartScreen(),
          ),
        ]);
  }
}
