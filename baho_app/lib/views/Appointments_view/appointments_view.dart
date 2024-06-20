import 'package:flutter/material.dart';
import 'package:baho_app/views/categories_view/categories_view.dart';
import 'package:baho_app/consts/consts.dart';

class AppointmentsView extends StatelessWidget {
  const AppointmentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> appointments = [
      {
        'name': 'Dr John',
        'time': '9-AM to 12 PM',
        'imageUrl': 'assets/images/jean.png',
      },
      {
        'name': 'Dr Joseph',
        'time': '9-AM to 12 PM',
        'imageUrl': 'assets/images/doctor1.jpeg',
      },
      {
        'name': 'Dr Michael',
        'time': '11-AM to 17 PM',
        'imageUrl': 'assets/images/doctor2.jpeg',
      },
      {
        'name': 'Dr Aime',
        'time': '9-PM to 6-AM',
        'imageUrl': 'assets/images/doctor3.jpeg',
      },
      {
        'name': 'Dr Leon',
        'time': '9-AM to 12 PM',
        'imageUrl': 'assets/images/doctor4.jpeg',
      },
      {
        'name': 'Ariane',
        'time': '5-PM to 9 PM',
        'imageUrl': 'assets/images/ariane.jpeg',
      },
      {
        'name': 'Dr Sarah',
        'time': '5-PM to 9 PM',
        'imageUrl': 'assets/images/jeanne.png',
      },
      {
        'name': 'Dr Alex',
        'time': '5-PM to 9 PM',
        'imageUrl': 'assets/images/Alex.png',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Appointments',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: AppColors.primaryColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handle back button press
          },
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: appointments.length,
        itemBuilder: (context, index) {
          final appointment = appointments[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(appointment['imageUrl']!),
            ),
            title: Text(
              appointment['name']!,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(appointment['time']!),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set the current index to Appointments
        type: BottomNavigationBarType.fixed,
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
        onTap: (index) {
          // Navigate to different views based on the selected index
          if (index == 0) {
            Navigator.pop(context); // Go back to HomeView
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TotalCategoryPage()),
            );
          } else if (index == 2) {
            // Already on AppointmentsView, do nothing
          } else if (index == 3) {
            // Add navigation to settings if needed
          }
        },
      ),
    );
  }
}
