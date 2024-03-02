// import 'package:flutter/material.dart';
//
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Choose User Type'),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/therapist_dashboard');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 40.0),
//                 ),
//                 child: const Text(
//                   'Therapist',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ),
//             SizedBox(height: 20.0),
//             Expanded(
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.pushNamed(context, '/patient_screen');
//                 },
//                 style: ElevatedButton.styleFrom(
//                   padding: EdgeInsets.symmetric(vertical: 40.0),
//                 ),
//                 child: Text(
//                   'Patient',
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose User Type'),
      ),
      backgroundColor: Colors.black, // Set body background color to black
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SizedBox(
                height: 1000, // Set the height of the button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/therapist_dashboard');
                  },
                  child: const Text(
                    'Therapist',
                    style: TextStyle(fontSize: 24.0), // Set text size to 24
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
            SizedBox(height: 20.0),
            Expanded(
              child: SizedBox(
                height: 1000, // Set the height of the button
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/patient_screen');
                  },
                  child: Text(
                    'Patient',
                    style: TextStyle(fontSize: 24.0), // Set text size to 24
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
      ),
    );
  }
}