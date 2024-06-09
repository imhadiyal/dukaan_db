import 'package:dukaan/controller/api_controller.dart';
import 'package:dukaan/helper/login_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'controller/data_controller.dart';
import 'controller/product_controller.dart';

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
        ChangeNotifierProvider(create: (_) => ProductController()),
        ChangeNotifierProvider(create: (_) => Api()),
      ],
      child: MyApp(isLogin: isLogin),
    ),
  );
}
