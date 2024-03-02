import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PatientDashboard extends StatefulWidget {
  final Map<String, dynamic> patientData;

  PatientDashboard(this.patientData);

  @override
  _PatientDashboardState createState() => _PatientDashboardState();
}

class _PatientDashboardState extends State<PatientDashboard> {
  List<String> selectedMoods = []; // List to store selected moods

  // Sample mood data for the timeline
  final List<Map<String, dynamic>> moodData = [
    {'date': '2022-03-01', 'mood': 'Happy'},
    {'date': '2022-03-02', 'mood': 'Sad'},
    {'date': '2022-03-03', 'mood': 'Excited'},
    {'date': '2022-03-04', 'mood': 'Relaxed'},
    {'date': '2022-03-05', 'mood': 'Angry'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Dashboard'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Patient Overview',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            _buildProgressChart(),
            SizedBox(height: 20.0),
            Text(
              'Mood Timeline',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            _buildMoodTimeline(),
            SizedBox(height: 20.0),
            Text(
              'Therapist Notes',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            _buildNotesSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProgressChart() {
    // Placeholder data for the progress chart
    List<FlSpot> spots = [
      FlSpot(1, 20),
      FlSpot(2, 60),
      FlSpot(3, 35),
      FlSpot(4, 71),
      FlSpot(5, 82),
    ];

    return Container(
      height: 300,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: false, // Use straight lines
              colors: [Colors.blue],
              barWidth: 4,
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(
                show: true,
                colors: [Colors.red.withOpacity(0.3)],
              ),
            ),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(showTitles: false),
            leftTitles: SideTitles(showTitles: false),
          ),
          gridData: FlGridData(show: false),
        ),
      ),
    );
  }

  Widget _buildMoodTimeline() {
    return Container(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moodData.length,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  moodData[index]['date'],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Use mood color or customize
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    moodData[index]['mood'],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildNotesSection() {
    // Placeholder notes data
    List<String> therapistNotes = [
      'Week 1: Patient showed improvement in mood.',
      'Week 2: Patient struggled with anxiety, but coping mechanisms are being learned.',
      'Week 3: Significant progress observed in handling stressful situations.',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: therapistNotes.map((note) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 5.0),
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            note,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        );
      }).toList(),
    );
  }
}
