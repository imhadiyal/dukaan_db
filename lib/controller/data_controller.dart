import 'package:dukaan/modals/login_modals.dart';
import 'package:flutter/widgets.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/login_helper.dart';

class DataController extends ChangeNotifier {
  SharedPreferences preferences;

  DataController({required this.preferences}) {
    initData()
        .then(
          (value) => Logger().i("data create"),
        )
        .onError((error, stakTrace) => Logger().e("error:$error"));
  }
  List<LoginModals> list = [];

  Future<void> initData() async {
    list = await LoginHelper.loginHelper.getallData();
    notifyListeners();
  }

  Future<void> loginInsertData({required LoginModals modal}) async {
    await preferences.setBool('isLogin', true);
    await LoginHelper.loginHelper.insertData(loginmodals: modal);
    initData();
    notifyListeners();
  }

  bool login({required LoginModals modal}) {
    bool value = false;
    notifyListeners();
    list.forEach(
      (element) {
        value =
            element.email == modal.email && element.password == modal.password;

        notifyListeners();
      },
    );
    return value;
  }
}
