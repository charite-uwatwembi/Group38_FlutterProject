// home_view.dart
import 'package:flutter/material.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/views/doctor_view/doctor_card.dart'; // Import the DoctorCard class
import 'package:baho_app/views/categories_view/categories_view.dart'; // Import the categories view

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Create a list of doctor data
    final List<Map<String, String>> doctors = [
      {
        'name': 'Dr Alex',
        'specialty': 'Neurologist',
        'imageUrl': 'assets/images/Alex.png',
      },
      {
        'name': 'Dr Sarah',
        'specialty': 'Cardiologist',
        'imageUrl': 'assets/images/jeanne.png',
      },
      {
        'name': 'Dr John',
        'specialty': 'Orthopedist',
        'imageUrl': 'assets/images/jean.png',
      },
      {
        'name': 'Dr Joseph',
        'specialty': 'Pediatrician',
        'imageUrl': 'assets/images/doctor1.jpeg',
      },
      {
        'name': 'Dr Michael',
        'specialty': 'Dermatology',
        'imageUrl': 'assets/images/doctor2.jpeg',
      },
      {
        'name': 'Dr Linda',
        'specialty': 'Psychiatrist',
        'imageUrl': 'assets/images/doctor4.jpeg',
      },
      {
        'name': 'Dr Benoit',
        'specialty': 'Dentist',
        'imageUrl': 'assets/images/doctor5.jpeg',
      },
      {
        'name': 'Dr Ariane',
        'specialty': 'Pediatrician',
        'imageUrl': 'assets/images/ariane.jpeg',
      },
      {
        'name': 'Dr Aime',
        'specialty': 'Internist',
        'imageUrl': 'assets/images/doctor3.jpeg',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(
          color: AppColors.bgColor, // Set the back button color to white
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
                itemCount: doctors.length, // Number of doctor cards
                itemBuilder: (context, index) {
                  final doctor = doctors[index];
                  return DoctorCard(
                    name: doctor['name']!,
                    specialty: doctor['specialty']!,
                    imageUrl: doctor['imageUrl']!,
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
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TotalCategoryPage()),
            );
          }
          // Add more conditions for other indices if needed
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
