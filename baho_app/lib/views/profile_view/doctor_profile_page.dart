import 'dart:math';
import 'package:flutter/material.dart';
import 'package:baho_app/consts/consts.dart';
import 'package:baho_app/views/booking_view/bookingForm_view.dart';

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
    // Generate a random rating between 1 and 5
    final double rating = (Random().nextDouble() * 4 + 1).roundToDouble();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
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
            SizedBox(height: 8),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < rating ? Icons.star : Icons.star_border,
                    color: Colors.yellow,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Phone Number',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(phoneNumber),
            SizedBox(height: 16),
            Text(
              'About',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(about),
            SizedBox(height: 16),
            Text(
              'Address',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(address),
            SizedBox(height: 16),
            Text(
              'Working Time',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(workingTime),
            SizedBox(height: 16),
            Text(
              'Services',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(services),
            SizedBox(height: 100),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BookingFormPage(doctorName: name),
                    ),
                  );
                },
                child: Text(
                  'Book an appointment',
                  style: TextStyle(color: Colors.white),
                ),
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
