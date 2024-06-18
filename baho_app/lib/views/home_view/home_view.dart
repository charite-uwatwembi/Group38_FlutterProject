// home_view.dart
import 'package:flutter/material.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/views/doctor_view/doctor_card.dart'; // Import the DoctorCard class
import 'package:baho_app/views/categories_view/categories_view.dart'; // Import the categories view

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: 9, // Number of doctor cards
                itemBuilder: (context, index) {
                  return DoctorCard(
                    name: 'Dr Alex',
                    specialty: 'Neurologist',
                    imageUrl: 'assets/images/Alex.png',
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
