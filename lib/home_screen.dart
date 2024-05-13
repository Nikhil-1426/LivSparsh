import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'speechinsighthub.dart'; // Import Speech Insight Hub

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Home Screen!',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Speech Insight Hub screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SpeechInsightHub(),
                  ),
                );
              },
              child: Text('Speech Insight Hub'), // Button for Speech Insight Hub
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the sign-in screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignUpScreen(),
                  ),
                );
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}

