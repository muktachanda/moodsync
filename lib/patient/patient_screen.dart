import 'package:flutter/material.dart';

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black, // Set app bar background color to black
        // title: Text('Patient Screen'),
      ),
      backgroundColor: Colors.black, // Set body background color to black
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 1000, // Set the height of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/patient/chat');
                },
                child: Text(
                  'Messaging',
                  style: TextStyle(fontSize: 24), // Increase text size to 24
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.grey[900]!, // Set button background color to dark grey
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white, // Set button text color to white
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 1000, // Set the height of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/patient/moodtracker');
                },
                child: Text(
                  'Mood Tracker',
                  style: TextStyle(fontSize: 24), // Increase text size to 24
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.grey[900]!, // Set button background color to dark grey
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white, // Set button text color to white
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 1000, // Set the height of the button
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/patient/spotify-auth');
                },
                child: Text(
                  'Spotify Analysis',
                  style: TextStyle(fontSize: 24), // Increase text size to 24
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // No border radius
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Colors.grey[900]!, // Set button background color to dark grey
                  ),
                  foregroundColor: MaterialStateProperty.all<Color>(
                    Colors.white, // Set button text color to white
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}