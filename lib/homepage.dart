import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose User Type'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/therapist_dashboard');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                ),
                child: const Text(
                  'Therapist',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/patient_screen');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 40.0),
                ),
                child: Text(
                  'Patient',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}