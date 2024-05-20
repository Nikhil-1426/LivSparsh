import 'package:flutter/material.dart';
//import 'home_screen.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 235, 89, 81),
        //provides info about the app
        title: const Text('About Us'),
      ),
    );
  }
}
