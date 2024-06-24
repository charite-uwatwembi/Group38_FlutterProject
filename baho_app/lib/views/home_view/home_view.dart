import 'package:flutter/material.dart';
import 'package:baho_app/views/doctor_view/doctor_card.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/views/categories_view/categories_view.dart';
import 'package:baho_app/views/appointments_view/appointments_view.dart';
import 'package:baho_app/views/settings_view/settings_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> doctors = [
      {
        'name': 'Dr Alex',
        'specialty': 'Neurologist',
        'imageUrl': 'assets/images/Alex.png',
        'phoneNumber': '+250787118178',
        'about': 'Neurologist for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Neurology, Family physician',
      },
       {
        'name': 'Dr Sarah',
        'specialty': 'Cardiologist',
        'imageUrl': 'assets/images/jeanne.png',
        'phoneNumber': '+250787118178',
        'about': 'Cardiologist for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Cardiology, Family physician',
      },
      {
        'name': 'Dr John',
        'specialty': 'Orthopedist',
        'imageUrl': 'assets/images/jean.png',
        'phoneNumber': '+250787118178',
        'about': 'Orthopedist for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Orthopedics, Family physician',
      },
      {
        'name': 'Dr Joseph',
        'specialty': 'Pediatrician',
        'imageUrl': 'assets/images/doctor1.jpeg',
        'phoneNumber': '+250787118178',
        'about': 'Pediatrician for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Pediatrics, Family physician',
      },
      {
        'name': 'Dr Michael',
        'specialty': 'Dermatology',
        'imageUrl': 'assets/images/doctor2.jpeg',
        'phoneNumber': '+250787118178',
        'about': 'Dermatologist for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Dermatology, Family physician',
      },
      {
        'name': 'Dr Leon',
        'specialty': 'Psychiatrist',
        'imageUrl': 'assets/images/doctor4.jpeg',
        'phoneNumber': '+250787118178',
        'about': 'Psychiatrist for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Psychiatry, Family physician',
      },
      {
        'name': 'Dr Benoit',
        'specialty': 'Dentist',
        'imageUrl': 'assets/images/doctor5.jpeg',
        'phoneNumber': '+250787118178',
        'about': 'Dentist for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Dentistry, Family physician',
      },
      {
        'name': 'Dr Ariane',
        'specialty': 'Pediatrician',
        'imageUrl': 'assets/images/ariane.jpeg',
        'phoneNumber': '+250787118178',
        'about': 'Pediatrician for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Pediatrics, Family physician',
      },
      {
        'name': 'Dr Aime',
        'specialty': 'Internist',
        'imageUrl': 'assets/images/doctor3.jpeg',
        'phoneNumber': '+250787118178',
        'about': 'Internist for 10 years, worked in USA and Rwanda',
        'address': 'Kigali, Rwanda',
        'workingTime': '9-AM to 12-PM',
        'services': 'Interns, Family physician',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(
          color: AppColors.bgColor,
        ),
        title: Row(
          children: [
            SizedBox(width: 10),
            Text(
              "Welcome Dear Patient",
              style: TextStyle(color: AppColors.bgColor),
            ),
          ],
        ),
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
              child: GridView.builder(
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
                    name: doctor['name']!,
                    specialty: doctor['specialty']!,
                    imageUrl: doctor['imageUrl']!,
                    phoneNumber: doctor['phoneNumber']!,
                    about: doctor['about']!,
                    address: doctor['address']!,
                    workingTime: doctor['workingTime']!,
                    services: doctor['services']!,
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {},
              child: Text(
                'View All',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
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
