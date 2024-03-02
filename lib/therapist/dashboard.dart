import 'package:flutter/material.dart';

class TherapistDashboard extends StatelessWidget {
  const TherapistDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Therapist Dashboard'),
      ),
      body: const Center(
        child: Text('Welcome to Therapist Dashboard'),
      ),
    );
  }
}
