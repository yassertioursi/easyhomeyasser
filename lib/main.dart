import 'package:easyhome/User/features/F1_Login&Signup/Screens/Email_verification.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Forget_password.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Login.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Signup_1.dart';
import 'package:easyhome/User/features/F1_Login&Signup/Screens/Signup_2.dart';
import 'package:easyhome/User/features/User_App/All_5_features.dart';
import 'package:easyhome/User/features/User_App/F4_Deals_Apps/Deals&Apps.dart';
import 'package:easyhome/Worker/features/Worker_App/All_4_features.dart';
import 'package:easyhome/Worker/features/Worker_App/F1_Home_Worker/Home_Worker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home_User(),
      /* routes: {
          '/login': (context) => Login(),
          '/Signup_1': (context) => Signup(),
          //'/Signup_2': (context) => Signup_2(),
          '/Email_Verification': (context) => Email_verifcation(),
          '/Forget_password': (context) => Forget_Pass(),
        }*/
    );
  }
}
