import 'package:flutter/material.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/views/home_view/home_view.dart';
import 'package:baho_app/views/settings_view/settings_view.dart';
import 'package:baho_app/views/appointments_view/appointments_view.dart'; // Import the AppointmentsView

class TotalCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Category', style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
          children: [
            // All categories
            CategoryCard(
              icon: Icons.person,
              label: 'Body',
              specialists: 25,
            ),
            // Eear speacialist doctor
            CategoryCard(
              icon: Icons.hearing,
              label: 'Ear',
              specialists: 8,
            ),
            // lungs doctor card
            CategoryCard(
              icon: Icons.air,
              label: 'Lungs',
              specialists: 13,
            ),
            // Kidney doctor specialist
            CategoryCard(
              icon: Icons.bubble_chart,
              label: 'Kidneys',
              specialists: 10,
            ),
            // Heart specialist card
            CategoryCard(
              icon: Icons.favorite,
              label: 'Heart',
              specialists: 13,
            ),
            // Dental specialist doctor
            CategoryCard(
              icon: Icons.health_and_safety,
              label: 'Dental',
              specialists: 5,
            ),
            //  psychology doctor card
            CategoryCard(
              icon: Icons.psychology,
              label: 'psychology',
              specialists: 25,
            ),
            // Neurologist   card
            CategoryCard(
              icon: Icons.biotech,
              label: 'Neurology',
              specialists: 25,
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
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

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int specialists;

  CategoryCard(
      {required this.icon, required this.label, required this.specialists});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: AppColors.primaryColor),
            SizedBox(height: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 5),
            Text(
              '$specialists specialists',
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
