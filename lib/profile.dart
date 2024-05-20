import 'package:flutter/material.dart';
//import 'home_screen.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(218, 118, 238, 0.973),
        title: const Text('Profile'),
      ),
    );
  }
}
