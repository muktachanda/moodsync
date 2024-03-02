import 'package:flutter/material.dart';
import 'homepage.dart';
import 'therapist/dashboard.dart';
import 'patient/patient_screen.dart';
import 'patient/page1.dart'; // Import Page1 from patient folder
import 'patient/moodtracker.dart'; // Import Page2 from patient folder
import 'patient/page3.dart'; // Import Page3 from patient folder
import 'patient/chat.dart'; // Import Page3 from patient folder

void main() {
  runApp(const MyApp());
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
}
