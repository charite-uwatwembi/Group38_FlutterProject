import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/fonts.dart';
import 'views/login_view/login_view.dart';
import 'views/landing_view/landing_view.dart';
import 'views/home_view/home_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: AppFonts.nunito),
      debugShowCheckedModeBanner: false,
      initialRoute: '/LandingView',
      getPages: [
        GetPage(name: '/LoginView', page: () => LoginView()),
        GetPage(name: '/LandingView', page: () => LandingView()),
        GetPage(name: '/HomeView', page: () => HomeView()),
      ],
    );
  }
}
