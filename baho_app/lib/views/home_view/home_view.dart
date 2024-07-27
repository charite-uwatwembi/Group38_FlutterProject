import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/controllers/setting_controller.dart';
import 'package:baho_app/services/firestore_service.dart';
import 'package:baho_app/views/doctor_view/doctor_card.dart';
import 'package:baho_app/views/categories_view/categories_view.dart';
import 'package:baho_app/views/appointments_view/appointments_view.dart';
import 'package:baho_app/views/settings_view/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingController settingController = Get.put(SettingController());
    final FirestoreService firestoreService = FirestoreService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(
          color: AppColors.bgColor,
        ),
        title: Obx(() {
          if (settingController.isLoading.value) {
            return CircularProgressIndicator();
          } else {
            return Row(
              children: [
                SizedBox(width: 10),
                Text(
                  "Welcome ${settingController.username.value}",
                  style: TextStyle(color: AppColors.bgColor),
                ),
              ],
            );
          }
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search doctor',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Icon(
                  Icons.search,
                  color: Colors.blue,
                  size: 30,
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<List<Map<String, dynamic>>>(
                stream: firestoreService.getDoctors(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No doctors available'));
                  }

                  final doctors = snapshot.data!;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.75,
                    ),
                    itemCount: doctors.length,
                    itemBuilder: (context, index) {
                      final doctor = doctors[index];
                      return DoctorCard(
                        name: doctor['name'] ?? 'No name',
                        specialty: doctor['specialty'] ?? 'No specialty',
                        imageUrl: doctor['imageUrl'] ?? 'assets/default.png',
                        phoneNumber: doctor['phoneNumber'] ?? 'No phone',
                        about: doctor['about'] ?? 'No about',
                        address: doctor['address'] ?? 'No address',
                        workingTime: doctor['workingTime'] ?? 'No working time',
                        services: doctor['services'] ?? 'No services',
                        availability: List<Map<String, dynamic>>.from(doctor['availability'] ?? []),
                      );
                    },
                  );
                },
              ),
            ),
            // SizedBox(height: 10),
            // TextButton(
            //   onPressed: () {},
            //   child: Text(
            //     'View All',
            //     style: TextStyle(
            //       color: Colors.blue,
            //       decoration: TextDecoration.underline,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primaryColor,
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        onTap: (index) {
          if (index == 0) {
            // Already on HomeView, do nothing
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
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsView()),
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
