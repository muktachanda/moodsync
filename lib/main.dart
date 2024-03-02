import 'package:flutter/material.dart';
import 'homepage.dart';
import 'therapist/dashboard.dart';
import 'patient/patient_screen.dart';
import 'patient/page1.dart'; // Import Page1 from patient folder
import 'patient/moodtracker.dart'; // Import Page2 from patient folder
import 'patient/page3.dart'; // Import Page3 from patient folder
import 'patient/chat.dart'; // Import Page3 from patient folder

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Therapist and Patient',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/therapist_dashboard': (context) => Dashboard(),
        '/patient_screen': (context) => PatientScreen(),
        '/patient/chat': (context) => ChatScreen(),
        '/patient/moodtracker': (context) => MoodTracker(),
        '/patient/page3': (context) => Page3(),
      },
    );
  }

  Widget _buildComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: (text) => _handleSubmitted(text, 'User'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text, 'User'),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}
