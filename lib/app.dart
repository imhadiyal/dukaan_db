import 'package:dukaan/pages/ios/ios_login_page/los_login.dart';
import 'package:dukaan/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'controller/data_controller.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.isLogin});

  bool isLogin;

  @override
  Widget build(BuildContext context) {
    return Provider.of<DataController>(context).isAndroid
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: isLogin
                ? Routes.routes.loginPage
                : Routes.routes.registrationPage,
            routes: Routes.routes.routesmap,
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.routes.iosloginPage,
            routes: Routes.routes.routesmap,
          );
  }
}
