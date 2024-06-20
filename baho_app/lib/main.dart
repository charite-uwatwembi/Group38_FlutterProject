import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/fonts.dart';
import 'views/login_view/login_view.dart';
import 'views/landing_view/landing_view.dart';
import 'views/home_view/home_view.dart';

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
      initialRoute: '/LoginView',
      getPages: [
        GetPage(name: '/LoginView', page: () => LoginView()),
        GetPage(name: '/LandingView', page: () => LandingView()),
        GetPage(name: '/HomeView', page: () => HomeView()),
      ],
    );
  }
}
