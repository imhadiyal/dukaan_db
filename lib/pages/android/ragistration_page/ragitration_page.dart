import 'package:dukaan/controller/data_controller.dart';
import 'package:dukaan/modals/login_modals.dart';
import 'package:dukaan/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppSignUp extends StatelessWidget {
  const AppSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    LoginModals user = LoginModals.empty();
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    // Get screen size to scale widgets accordingly
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding:
            EdgeInsets.symmetric(horizontal: 20, vertical: screenHeight * 0.05),
        width: double.infinity,
        height: screenHeight,
        color: Colors.white70,
        child: Column(
          children: [
            Flexible(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create\nyour account',
                    style: TextStyle(
                      fontSize:
                          screenWidth * 0.08, // Dynamically adjust font size
                      color: Color(0xFFBC1F26),
                    ),
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  _buildTextField(
                    context: context,
                    hintText: "Email",
                    icon: Icons.email,
                    onChanged: (val) => user.email = val,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(
                    context: context,
                    hintText: "Password",
                    icon: Icons.password,
                    onChanged: (val) => user.password = val,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextField(
                    context: context,
                    hintText: "Confirm Password",
                    icon: Icons.password_sharp,
                    onChanged: (val) => user.password = val,
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    height: screenHeight / 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFF2F3F7),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<DataController>(context, listen: false)
                            .loginInsertData(modal: user);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFBC1F26),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Color(0xFFBC1F26)),
                        ),
                      ),
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth *
                              0.05, // Dynamically adjust font size
                          fontFamily: 'Poppins-Medium.ttf',
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.routes.loginPage);
                      },
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Color(0xFFAC252B),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build text fields
  Widget _buildTextField({
    required BuildContext context,
    required String hintText,
    required IconData icon,
    required Function(String) onChanged,
  }) {
    double defaultFontSize = 14;
    double defaultIconSize = 17;

    return TextField(
      onChanged: onChanged,
      showCursor: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          borderSide: BorderSide(width: 0, style: BorderStyle.none),
        ),
        filled: true,
        prefixIcon: Icon(icon, color: Color(0xFF666666), size: defaultIconSize),
        fillColor: Color(0xFFF2F3F5),
        hintStyle: TextStyle(
          color: Color(0xFF666666),
          fontSize: defaultFontSize,
        ),
        hintText: hintText,
      ),
    );
  }
}
