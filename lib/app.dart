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
          isLogin ? Routes.routes.loginPage : Routes.routes.registrationPage,
      routes: Routes.routes.routesmap,
    );
  }
}
