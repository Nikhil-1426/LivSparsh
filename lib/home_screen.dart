import 'package:flutter/material.dart';
import 'package:livsparsh/aboutus.dart';
//import 'package:flutter/painting.dart'; // This import is not required
//import 'package:livsparsh/signin_screen.dart'; // Not used in this code
import 'signup_screen.dart';
import 'speechinsighthub.dart'; // Import Speech Insight Hub
import 'profile.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Livsparsh'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(246, 148, 240, 175),
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: UserAccountsDrawerHeader(
                accountName: Text("XYZ"),
                accountEmail: Text("XYZ@gmail.com"),
              ),
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
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profile()),
              ),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("My Profile"),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutUs()),
              ),
              child: ListTile(
                leading: Icon(Icons.info_rounded),
                title: Text("About Us"),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignUpScreen()),
              ),
              child: ListTile(
                leading: Icon(Icons.logout_rounded),
                title: Text("Logout"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

