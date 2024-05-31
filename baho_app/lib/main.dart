import 'package:flutter/material.dart';
import 'consts/fonts.dart';
import 'package:get/get.dart';
import 'package:baho_app/views/Login_view/login_view.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
