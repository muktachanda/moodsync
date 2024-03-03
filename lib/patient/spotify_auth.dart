import 'package:flutter/material.dart';

class SpotifyAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set Scaffold background color to black
      appBar: AppBar(
//         title: Text('Spotify Authorization'),
        backgroundColor: Colors.black, // Set app bar background color to black
        iconTheme: IconThemeData(color: Colors.white), // Set back button color to white
      ),
      body: Center( // Center the content vertically and horizontally
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Authorize Moodsync to access your Spotify account',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white), // Set text color to white
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Implement Spotify authorization logic
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Text(
                  'Authorize',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
