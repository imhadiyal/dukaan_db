import 'package:dukaan/controller/data_controller.dart';
import 'package:dukaan/modals/login_modals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('loginPage'),
        leading: IconButton(
          onPressed: () {
            Provider.of<DataController>(context, listen: false).loginValueChang(
              modal: LoginModals(
                1,
                "darshan@mail.io",
                'darshan_password',
              ),
            );
          },
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
