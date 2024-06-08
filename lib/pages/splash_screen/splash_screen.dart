import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FlutterLogoStyle mystyle = FlutterLogoStyle.markOnly;
  changePage() {
    Future.delayed(Duration(microseconds: 500), () {
      setState(() {
        mystyle = FlutterLogoStyle.horizontal;
      });
    });
    Timer.periodic(Duration(seconds: 4), (timer) {
      Navigator.of(context).pushReplacementNamed('login_page');
      timer.cancel();
    });
  }

  @override
  void initState() {
    super.initState();
    changePage();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('hello'),
      ),
    );
  }
}
