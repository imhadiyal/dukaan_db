import 'package:dukaan/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app.dart';
import 'controller/data_controller.dart';
import 'controller/login_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoginHelper.loginHelper.initdb();

  SharedPreferences preferences = await SharedPreferences.getInstance();

  bool isLogin = preferences.getBool('isLogin') ?? false;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DataController(preferences: preferences)),
        // ChangeNotifierProvider(create: (_) => loginController()),
      ],
      child: MyApp(isLogin: isLogin),
    ),
  );
}
