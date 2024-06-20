import 'package:baho_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:baho_app/views/home_view/home_view.dart';

class TotalCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Total Category',style: TextStyle(color: Colors.white)),
        
        backgroundColor: Colors.blue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          children: [
            CategoryCard(
              icon: Icons.person,
              label: 'Body',
              specialists: 25,
            ),
            CategoryCard(
              icon: Icons.hearing,
              label: 'Ear',
              specialists: 8,
            ),
            CategoryCard(
              icon: Icons.air,
              label: 'Lungs',
              specialists: 13,
            ),
            CategoryCard(
              icon: Icons.bubble_chart,
              label: 'Kidneys',
              specialists: 10,
            ),
            CategoryCard(
              icon: Icons.favorite,
              label: 'Heart',
              specialists: 13,
            ),
            CategoryCard(
              icon: Icons.health_and_safety,
              label: 'Dental',
              specialists: 5,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeView()),
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

class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final int specialists;

  CategoryCard({required this.icon, required this.label, required this.specialists});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 50, color: Colors.white),
          SizedBox(height: 10),
          Text(
            label,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            '$specialists specialists',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
