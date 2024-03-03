import 'package:flutter/material.dart';
import 'homepage.dart';
import 'therapist/dashboard.dart';
import 'patient/patient_screen.dart';
import 'patient/moodtracker.dart'; // Import Page2 from patient folder
import 'patient/spotify_auth.dart'; // Import Page3 from patient folder
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
        '/therapist/dashboard': (context) => Dashboard(),
        '/patient/dashboard': (context) => PatientScreen(),
        '/patient/chat': (context) => PatientChatScreen(),
        '/patient/mood-tracker': (context) => MoodTracker(),
        '/patient/spotify-auth': (context) => SpotifyAuth(),
      },
    );
  }
}
