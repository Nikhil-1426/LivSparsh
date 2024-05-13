import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SpeechInsightHub extends StatefulWidget {
  @override
  _SpeechInsightHubState createState() => _SpeechInsightHubState();
}

class _SpeechInsightHubState extends State<SpeechInsightHub> {
  TextEditingController _goalsController = TextEditingController();
  String _output = '';

  Future<void> _submitGoals(String goals) async {
    // Initialize Firebase if not already initialized
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp();
    }

    // Add the user's goals to Firestore
    await FirebaseFirestore.instance.collection('goals').add({
      'goals': goals,
    });

    // Wait for a moment to let the data sync with Firebase (optional)
    await Future.delayed(Duration(seconds: 2));

    // Retrieve the generated output from Firestore
    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection('output')
        .orderBy('timestamp', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isNotEmpty) {
      setState(() {
        _output = snapshot.docs.first['output'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech Insight Hub'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _goalsController,
              decoration: InputDecoration(
                labelText: 'Enter your goals',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _submitGoals(_goalsController.text);
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 20),
            Text(
              'Generated Output:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(_output),
          ],
        ),
      ),
    );
  }
}

