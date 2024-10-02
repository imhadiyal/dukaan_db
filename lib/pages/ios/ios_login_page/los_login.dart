import 'package:dukaan/controller/data_controller.dart';
import 'package:dukaan/extension.dart';
import 'package:dukaan/modals/login_modals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../routes.dart';

class ILoginPage extends StatelessWidget {
  const ILoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LoginModals user = LoginModals.empty();
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return CupertinoPageScaffold(
      resizeToAvoidBottomInset: false,
      child: Container(
        padding:
            const EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CupertinoSwitch(
              value: Provider.of<DataController>(context).isAndroid,
              onChanged: (val) {
                Provider.of<DataController>(context, listen: false).swich();
              },
            ),
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Login into\nyour account',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color(0xFFBC1F26),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  30.ofHeight,
                  CupertinoTextField(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    placeholder: 'Enter Email',
                    placeholderStyle:
                        const TextStyle(color: CupertinoColors.systemGrey),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: CupertinoColors.black,
                    ),
                    cursorColor: CupertinoColors.black,
                    clearButtonMode: OverlayVisibilityMode.editing,
                    onChanged: (val) {
                      user.email = val;
                    },
                    showCursor: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CupertinoTextField(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                    placeholder: 'Enter text',
                    placeholderStyle:
                        const TextStyle(color: CupertinoColors.systemGrey),
                    decoration: BoxDecoration(
                      color: CupertinoColors.systemGrey6,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    style: const TextStyle(
                      fontSize: 18,
                      color: CupertinoColors.black,
                    ),
                    cursorColor: CupertinoColors.systemRed,
                    clearButtonMode: OverlayVisibilityMode.editing,
                    onChanged: (val) {
                      user.password = val;
                    },
                    showCursor: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                    width: double.infinity,
                    child: CupertinoButton(
                      color: const Color(0xFFBC1F26),
                      onPressed: () {
                        if (Provider.of<DataController>(context, listen: false)
                            .login(modal: user)) {
                          Navigator.pushNamed(context, Routes.routes.homePage);
                        }
                        Navigator.pushNamed(context, Routes.routes.homePage);
                      },
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Poppins-Medium.ttf',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                        color: const Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(
                            context, Routes.routes.registrationPage)
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: const Color(0xFFAC252B),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
