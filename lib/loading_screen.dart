import 'package:flutter/material.dart';
import 'signup_screen.dart'; // Import the sign-up screen

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delayed navigation to the sign-up screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignUpScreen()), // Navigate to the sign-up screen
      );
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Project Logo.jpg',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            Text(
              'Loading...',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

