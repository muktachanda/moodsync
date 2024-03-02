// import 'package:flutter/material.dart';
//
// class Page2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 2'),
//       ),
//       body: Center(
//         child: Text('This is Page 2'),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'moodtracker.dart'; // Import your MoodTracker page file

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Directly navigate to MoodTracker page when Page2 is built
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MoodTracker()), // Navigate to MoodTracker page
      );
    });

    // Placeholder widget until navigation occurs
    return Scaffold(
      appBar: AppBar(
        title: Text('Page 2'),
      ),
      body: Center(
        child: CircularProgressIndicator(), // Show a loading indicator
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'moodtracker.dart'; // Import your MoodTracker page file
//
// class Page2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Page 2'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => MoodTracker()), // Navigate to MoodTracker page
//             );
//           },
//           child: Text('Go to Mood Tracker'),
//         ),
//       ),
//     );
//   }
// }

