import 'package:baho_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:baho_app/views/settings_view/settings_view.dart';
import 'package:baho_app/views/home_view/home_view.dart';

import 'package:cloud_firestore/cloud_firestore.dart';


class FeedbackPage extends StatelessWidget {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FeedBack', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: double.infinity,
                  height: 100,
                ),
                Positioned(
                  top: 30,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 100),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(108, 168, 211, 236),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          'Baho',
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
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
                          controller: _commentController,
                          maxLines: 4,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 30),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              _submitFeedback(context);
                            },
                            child: Text('Submit', style: TextStyle(color: Colors.white)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              minimumSize: Size(150, 40),
                            ),
                          ),
                        ),
                        SizedBox(height: 80),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => HomeView()),
                            );
                          },
                          child: Text('Home', style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            minimumSize: Size(250, 40),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _submitFeedback(BuildContext context) async {
    try {
      
      CollectionReference feedbackCollection = FirebaseFirestore.instance.collection('feedback');

      
      await feedbackCollection.add({
        'comment': _commentController.text,
        'timestamp': FieldValue.serverTimestamp(),
      });

      
      _commentController.clear();

      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Feedback submitted successfully')),
      );
    } catch (e) {
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit feedback: $e')),
      );
    }
  }
}
