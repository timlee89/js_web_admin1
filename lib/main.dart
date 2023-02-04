import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:js_web_admin1/screens/home_screen.dart';
import 'package:js_web_admin1/screens/list_meditation.dart';
import 'package:js_web_admin1/screens/login_screen.dart';
import 'package:js_web_admin1/screens/register_meditation.dart';
import 'package:js_web_admin1/screens/test3.dart';
import 'package:js_web_admin1/screens/splash_screen.dart';
import 'package:js_web_admin1/screens/test_formBuilder.dart';
import 'package:js_web_admin1/screens/update_meditation.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // initialRoute: LoginScreen.id,
      initialRoute: HomeScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        LoginScreen.id: (context) => const LoginScreen(),
        HomeScreen.id: (context) => const HomeScreen(),
        RegisterMeditation.id: (context) => RegisterMeditation(),
        ListMeditation.id: (context) => const ListMeditation(),
        UpdateMeditation.id: (context) => const UpdateMeditation(),
        ManageItem.id: (context) => const ManageItem(),
        TestScreen.id: (context) => const TestScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: Center(
          child: Text(
            "HomeScreen",
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
        ),
      ),
    );
  }
}
