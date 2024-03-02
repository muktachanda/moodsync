import 'package:flutter/material.dart';
import 'homepage.dart';
import 'therapist/dashboard.dart';
import 'patient/patient_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        '/therapist_dashboard': (context) => TherapistDashboard(),
        '/patient_screen': (context) => PatientScreen(),
      },
    );
  }
}
