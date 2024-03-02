// import 'package:flutter/material.dart';
//
// class PatientScreen extends StatelessWidget {
//   const PatientScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Patient Screen'),
//       ),
//       body: const Center(
//         child: Text('Welcome to Patient Screen'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class PatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/patient/chat');
//                 Navigator.pushNamed(context, '/patient/page1');
              },
              child: Text('Page 1'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/patient/moodtracker');
              },
              child: Text('Page 2'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/patient/page3');
              },
              child: Text('Page 3'),
            ),
          ],
        ),
      ),
    );
  }
}
