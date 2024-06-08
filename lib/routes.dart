import 'package:dukaan/pages/home_page/home_page.dart';
import 'package:dukaan/pages/login_page/login_page.dart';
import 'package:dukaan/pages/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';

class Routes {
  Routes._();
  static final Routes routes = Routes._();
  String splashScreen = '/';
  String loginPage = 'login_page';

  Map<String, Widget Function(BuildContext)> routesmap = {
    '/': (context) => const SplashScreen(),
    'login_page': (context) => const LoginPage(),
  };
}
