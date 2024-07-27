import 'package:baho_app/controllers/auth_controller.dart';
import 'package:baho_app/controllers/setting_controller.dart';
import 'package:baho_app/views/landing_view/landing_view.dart';
import 'package:flutter/material.dart';
import 'package:baho_app/views/home_view/home_view.dart';
import 'package:baho_app/views/categories_view/categories_view.dart';
import 'package:baho_app/views/login_view/login_view.dart';
import 'package:baho_app/views/appointments_view/appointments_view.dart';
import 'package:baho_app/views/feedback_view/feedback_view.dart';
import 'package:get/get.dart';
import 'package:baho_app/controllers/setting_controller.dart';

class SettingsView extends StatelessWidget {
  final SettingController settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Obx(() {
        if (settingController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 20),
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/chico.jpg'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    settingController.username.value,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    settingController.email.value,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.description),
                    title: Text('Terms & Conditions'),
                    onTap: () {
                      
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.logout, color: Colors.red),
                    title: Text('Logout', style: TextStyle(color: Colors.red)),
                    onTap: () {
                      AuthController().signout();
                      Get.offAll(() => LandingView());
                    },
                  ),
                  SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FeedbackPage()),
                      );
                    },
                    child: Text(
                      'Leave us a feedback',
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
            );
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TotalCategoryPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AppointmentsView()),
            );
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
