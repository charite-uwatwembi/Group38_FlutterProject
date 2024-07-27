import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:baho_app/views/categories_view/categories_view.dart';
import 'package:baho_app/views/settings_view/settings_view.dart';
import 'package:baho_app/consts/consts.dart';

class AppointmentsView extends StatelessWidget {
  final Map<String, String>? newAppointment;

  const AppointmentsView({Key? key, this.newAppointment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Navigator.pop(context);
          },
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('appointments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Something went wrong'));
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No appointments found'));
          }

          final List<Map<String, String>> appointments = snapshot.data!.docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            return {
              'name': data['doctorName']?.toString() ?? 'Unknown',
              'time': data['time']?.toString() ?? 'Unknown',
              'date': data['date']?.toString() ?? 'Unknown',
              'imageUrl': data['doctorImageUrl']?.toString() ?? 'assets/images/default.png',
            };
          }).toList();

          if (newAppointment != null) {
            appointments.add(newAppointment!);
          }

          return ListView.builder(
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(appointment['time']!),
                    Text(appointment['date']!),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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
          if (index == 0) {
            Navigator.pop(context);
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TotalCategoryPage()),
            );
          } else if (index == 2) {
          } else if (index == 3) {
            
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SettingsView()),
            );
          }
        },
      ),
    );
  }
}
