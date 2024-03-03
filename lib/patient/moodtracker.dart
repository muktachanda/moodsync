// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Mood Tracker',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MoodTracker(),
//     );
//   }
// }
//
// class MoodTracker extends StatelessWidget {
//   const MoodTracker({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         // Navigate back to the three-button page
// //         Navigator.popUntil(context, ModalRoute.withName('/'));
//         Navigator.pushReplacementNamed(context, '/patient_screen');
//         return true;
//       },
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Mood Tracker',
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: const [
//                 SizedBox(height: 20),
//                 MoodGrid(),
//                 SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MoodGrid extends StatelessWidget {
//   const MoodGrid({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         MoodRow(
//           moods: [
//             MoodItem(name: 'Angry', color: Colors.red),
//             MoodItem(name: 'Excited', color: Colors.orange),
//             MoodItem(name: 'Elated', color: Colors.yellow),
//           ],
//         ),
//         MoodRow(
//           moods: [
//             MoodItem(name: 'Sad', color: Colors.blueGrey),
//             MoodItem(name: 'Happy', color: Colors.green),
//             MoodItem(name: 'Very Happy', color: Colors.lightGreen),
//           ],
//         ),
//         MoodRow(
//           moods: [
//             MoodItem(name: 'Tired', color: Colors.grey),
//             MoodItem(name: 'Quiet', color: Colors.blue),
//             MoodItem(name: 'Relaxed', color: Colors.indigo),
//           ],
//         ),
//       ],
//     );
//   }
// }
//
// class MoodRow extends StatelessWidget {
//   final List<MoodItem> moods;
//
//   const MoodRow({Key? key, required this.moods}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: List.generate(moods.length, (index) {
//         return GestureDetector(
//           onTap: () => _showMoodDialog(context, moods[index].name),
//           child: MoodBox(
//             name: moods[index].name,
//             color: moods[index].color,
//           ),
//         );
//       }),
//     );
//   }
//
//   void _showMoodDialog(BuildContext context, String moodName) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: Text('Selected Mood'),
//           content: Text('You selected: $moodName'),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: const Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
// class MoodBox extends StatelessWidget {
//   final String name;
//   final Color color;
//   final double boxSize = 100.0;
//
//   const MoodBox({Key? key, required this.name, required this.color})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(8),
//       width: boxSize,
//       height: boxSize,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Center(
//         child: Text(
//           name,
//           style: TextStyle(
//             fontSize: 14,
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class MoodItem {
//   final String name;
//   final Color color;
//
//   const MoodItem({required this.name, required this.color});
// }



import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MoodTracker(),
    );
  }
}

class MoodTracker extends StatelessWidget {
  const MoodTracker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Navigate back to the three-button page
//         Navigator.popUntil(context, ModalRoute.withName('/'));
        Navigator.pushReplacementNamed(context, '/patient_screen');
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Mood Tracker',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.black, // Set body background color to black
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(height: 20),
                MoodGrid(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MoodGrid extends StatelessWidget {
  const MoodGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MoodRow(
          moods: [
            MoodItem(name: 'Angry', color: Colors.red),
            MoodItem(name: 'Excited', color: Colors.orange),
            MoodItem(name: 'Elated', color: Colors.yellow),
          ],
        ),
        MoodRow(
          moods: [
            MoodItem(name: 'Sad', color: Colors.blueGrey),
            MoodItem(name: 'Happy', color: Colors.green),
            MoodItem(name: 'Very Happy', color: Colors.lightGreen),
          ],
        ),
        MoodRow(
          moods: [
            MoodItem(name: 'Tired', color: Colors.grey),
            MoodItem(name: 'Quiet', color: Colors.blue),
            MoodItem(name: 'Relaxed', color: Colors.indigo),
          ],
        ),
      ],
    );
  }
}

class MoodRow extends StatelessWidget {
  final List<MoodItem> moods;

  const MoodRow({Key? key, required this.moods}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(moods.length, (index) {
        return GestureDetector(
          onTap: () => _showMoodDialog(context, moods[index].name),
          child: MoodBox(
            name: moods[index].name,
            color: moods[index].color,
          ),
        );
      }),
    );
  }

  void _showMoodDialog(BuildContext context, String moodName) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Selected Mood'),
          content: Text('You selected: $moodName'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

class MoodBox extends StatelessWidget {
  final String name;
  final Color color;
  final double boxSize = 100.0;

  const MoodBox({Key? key, required this.name, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      width: boxSize,
      height: boxSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MoodItem {
  final String name;
  final Color color;

  const MoodItem({required this.name, required this.color});
}
