import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/res/components/custom_button.dart';

class LandingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: MediaQuery.of(context).size.height * 0.1, // Adjust this value to move content up
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: MediaQuery.of(context).size.height * 0.25, // Half bottom
              left: 16,
              right: 16,
              child: CustomButton(
                buttonText: AppStrings.start,
                onTap: () {
                  print("Button Pressed");
                  Get.toNamed('/LoginView');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
