import 'package:flutter/material.dart';
import 'package:baho_app/views/profile_view/doctor_profile_page.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final String phoneNumber;
  final String about;
  final String address;
  final String workingTime;
  final String services;

  const DoctorCard({
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
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorProfilePage(
              name: name,
              specialty: specialty,
              imageUrl: imageUrl,
              phoneNumber: phoneNumber,
              about: about,
              address: address,
              workingTime: workingTime,
              services: services,
            ),
          ),
        );
      },
      child: Card(
        child: Column(
          children: [
            Image.asset(imageUrl, height: 100, width: 100, fit: BoxFit.cover),
            Text(name),
            Text(specialty),
          ],
        ),
      ),
    );
  }
}
