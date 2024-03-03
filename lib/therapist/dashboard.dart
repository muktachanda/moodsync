import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'dart:math';
import 'patient_info.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> patients = [
    {
      'name': 'Alice',
      'tags': ['Depressed', 'At-risk'],
      'sessions': 8,
      'progress': 70,
    },
    {
      'name': 'Bob',
      'tags': ['Suicidal', 'At-risk'],
      'sessions': 12,
      'progress': 90,
    },
    {
      'name': 'Eve',
      'tags': ['Normal'],
      'sessions': 5,
      'progress': 40,
    },
  ];

  List<String> tags = ['Depressed', 'Anxiety', 'Suicidal', 'At-risk', 'Normal'];

  bool showNotifications = false;
  List<String> selectedTags = [];

  List<Map<String, dynamic>> filteredPatients = [];

  @override
  void initState() {
    super.initState();
    filteredPatients = patients;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.dark(
          primary: Colors.blue,
          secondary: Colors.green,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Therapist Dashboard',
            style: TextStyle(fontSize: 24.0),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotificationHistory()),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Dashboard Overview',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildPieChart(
                      dataMap: getTagsChartData(),
                      title: 'Tags',
                    ),
                    _buildPieChart(
                      dataMap: getSessionChartData(),
                      title: 'Num Sessions',
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Filter by Tags:',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: tags.map((tag) {
                    return FilterChip(
                      label: Text(
                        tag,
                        style: TextStyle(fontSize: 18.0),
                      ),
                      selected: selectedTags.contains(tag),
                      onSelected: (bool selected) {
                        setState(() {
                          if (selected) {
                            selectedTags.add(tag);
                          } else {
                            selectedTags.remove(tag);
                          }
                          filterPatients();
                        });
                      },
                    );
                  }).toList(),
                ),
              ),
              SizedBox(height: 20.0),
              DataTable(
                columnSpacing: 40.0,
                columns: [
                  DataColumn(label: Text('Patient', style: TextStyle(fontSize: 20.0))),
                  DataColumn(label: Text('Tags', style: TextStyle(fontSize: 20.0))),
                  DataColumn(label: Text('Sessions', style: TextStyle(fontSize: 20.0))),
                  DataColumn(label: Text('Progress', style: TextStyle(fontSize: 20.0))),
                ],
                rows: filteredPatients.map((patient) {
                  return DataRow(cells: [
                    DataCell(
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PatientInfo(patient)),
                          );
                        },
                        child: Text(
                          patient['name'],
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                    ),
                    DataCell(
                      Row(
                        children: (patient['tags'] as List<String>).map((tag) {
                          return Container(
                            margin: EdgeInsets.only(right: 5.0),
                            padding: EdgeInsets.symmetric(
                              vertical: 2.0,
                              horizontal: 5.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              tag,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    DataCell(
                      Text(
                        patient['sessions'].toString(),
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    DataCell(
                      Container(
                        width: 150,
                        height: 30,
                        child: LinearProgressIndicator(
                          value: patient['progress'] / 100,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void filterPatients() {
    setState(() {
      filteredPatients = patients.where((patient) {
        if (selectedTags.isEmpty) {
          return true;
        } else {
          return (patient['tags'] as List<String>).any((tag) => selectedTags.contains(tag));
        }
      }).toList();
    });
  }

  Widget _buildPieChart({required Map<String, double> dataMap, required String title}) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        PieChart(
          dataMap: dataMap,
          animationDuration: Duration(milliseconds: 800),
          chartLegendSpacing: 32.0,
          chartRadius: MediaQuery.of(context).size.width / 5,
          colorList: _generateRandomColors(dataMap.length, context),
        ),
      ],
    );
  }

  Map<String, double> getTagsChartData() {
    Map<String, double> dataMap = {};
    patients.forEach((patient) {
      (patient['tags'] as List<String>).forEach((tag) {
        dataMap[tag] = (dataMap[tag] ?? 0) + 1;
      });
    });
    return dataMap;
  }

  Map<String, double> getSessionChartData() {
    Map<String, double> dataMap = {};
    filteredPatients.forEach((patient) {
      dataMap[patient['name']] = patient['sessions'].toDouble();
    });
    return dataMap;
  }

  List<Color> _generateRandomColors(int count, BuildContext context) {
    List<Color> themeColors = [
      Color(0xFF0D47A1), // Blue
      Color(0xFF1565C0), // Blue
      Color(0xFF1976D2), // Blue
      Color(0xFF1E88E5), // Blue
      Color(0xFF2196F3), // Blue
      Color(0xFF42A5F5), // Blue
      Color(0xFF64B5F6), // Blue
      Color(0xFF90CAF9), // Blue Light
      Color(0xFFBBDEFB), // Blue Lighter
    ];

    List<Color> colors = [];
    Random random = Random();
    for (int i = 0; i < count; i++) {
      colors.add(themeColors[random.nextInt(themeColors.length)]);
    }
    return colors;
  }
}

class NotificationHistory extends StatelessWidget {
  final List<String> notificationHistory = [
    'Bob seems suicidal. Please check in with him.',
    'Alice needs help.',
  ];

  NotificationHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification History'),
      ),
      body: Container(
        color: Colors.grey[900], // Dark background color
        child: ListView.builder(
          itemCount: notificationHistory.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.grey[800], // Card background color
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  notificationHistory[index],
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18.0,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(Dashboard());
}

