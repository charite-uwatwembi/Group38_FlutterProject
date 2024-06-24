import 'package:flutter/material.dart';
import 'package:baho_app/views/settings_view/settings_view.dart';
import 'package:baho_app/views/home_view/home_view.dart';

class FeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white, // Set the back button color to white
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/logo.png'), // Replace with your logo path
              ),
              SizedBox(height: 10),
              Text(
                'Baho',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Rate your experience :)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: Icon(Icons.sentiment_very_satisfied, color: Colors.orange, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_satisfied, color: Colors.orange, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_neutral, color: Colors.orange, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_dissatisfied, color: Colors.orange, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.orange, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Comments:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Handle Submit
                },
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(150, 40),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()), // Replace with your HomeView
                  );
                },
                child: Text('Home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(150, 40),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
