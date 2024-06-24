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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/logo.png'), // Replace with your logo path
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Baho',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Rate your experience :)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.sentiment_very_satisfied, color: Colors.yellow, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_satisfied, color: Colors.yellow, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_neutral, color: Colors.yellow, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_dissatisfied, color: Colors.yellow, size: 30),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.sentiment_very_dissatisfied, color: Colors.yellow, size: 30),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Comments:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Handle Submit
                },
                child: Text('Submit'),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeView()), // Replace with your HomeView
                  );
                },
                child: Text('Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
