import 'package:baho_app/views/home_view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:baho_app/res/components/custom_button.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(LandingView());
}

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Welcome to Baho',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(height: 80),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.lightBlue.shade100,
                    child: CircleAvatar(
                      radius: 45,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        size: 40,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Baho',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(height: 40),
                  Text(
                    'We help you book your well-being!',
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  SizedBox(height: 100),
                  CustomButton(
                            buttonText: AppStrings.start, 
                            onTap: () {
                              Get.to(() =>  HomeView());
                            }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
