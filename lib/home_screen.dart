import 'package:flutter/material.dart';
//import 'package:flutter/painting.dart';
//import 'package:livsparsh/signin_screen.dart';
import 'signup_screen.dart';

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
          padding: const EdgeInsets.all(5),
          children: [
            DrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(246, 148, 240, 175)),
              child: UserAccountsDrawerHeader(
                  accountName: Text("XYZ"),
                  accountEmail: Text("XYZ@gmail.com")),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("My Profile"),
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text("logout"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpScreen()),
                ),
              },
            )
          ],
        ),
      ),
    );
  }
}
