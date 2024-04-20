import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Change the background color as needed
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Project Logo.jpg', // Replace 'assets/loading_image.png' with the path to your image asset
              width: 200, // Adjust the width of the image as needed
              height: 200, // Adjust the height of the image as needed
            ),
            SizedBox(height: 20), // Add some space between the image and the text
            Text(
              'Loading...', // Display loading text
              style: TextStyle(fontSize: 20), // Adjust the font size as needed
            ),
          ],
        ),
      ),
    );
  }
}
