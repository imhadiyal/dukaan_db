import 'package:dukaan/pages/login_page/login_page.dart';
import 'package:dukaan/pages/splash_screen/splash_screen.dart';
import 'package:dukaan/routes.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isLogin});
  bool isLogin;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:
          isLogin ? Routes.routes.splashScreen : Routes.routes.loginPage,
      routes: Routes.routes.routesmap,
    );
  }
}
