import 'dart:async';

import 'package:flutter/material.dart';
import 'package:js_web_admin1/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash-screen";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 5),
            () => Navigator.pushReplacementNamed(context, LoginScreen.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            height:200,
            width: 200,
            child: Image.asset(("assets/images/logo.png"))),
      ),
    );
  }
}

