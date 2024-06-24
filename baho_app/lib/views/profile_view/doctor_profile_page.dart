import 'package:baho_app/consts/consts.dart';
import 'package:flutter/material.dart';

class DoctorProfilePage extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final String phoneNumber;
  final String about;
  final String address;
  final String workingTime;
  final String services;

  const DoctorProfilePage({
    Key? key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.phoneNumber,
    required this.about,
    required this.address,
    required this.workingTime,
    required this.services,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: AssetImage(imageUrl),
                radius: 50,
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Center(
              child: Text(
                specialty,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ),
            SizedBox(height: 16),
            Text('Phone Number'),
            Text(phoneNumber),
            SizedBox(height: 16),
            Text('About'),
            Text(about),
            SizedBox(height: 16),
            Text('Address'),
            Text(address),
            SizedBox(height: 16),
            Text('Working Time'),
            Text(workingTime),
            SizedBox(height: 16),
            Text('Services'),
            Text(services),
            SizedBox(height: 150),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Book an appointment', 
                style: TextStyle(color: Colors.white,)),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
