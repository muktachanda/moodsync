import 'package:flutter/material.dart';
import 'dart:math';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Map<String, dynamic>> patients = [
    {
      'name': 'Alice',
      'tags': ['Depressed', 'Anxiety'],
    },
    {
      'name': 'Bob',
      'tags': ['Suicidal', 'At-risk'],
    },
    {
      'name': 'Eve',
      'tags': ['Normal'],
    },
  ];

  List<String> tags = ['Depressed', 'Anxiety', 'Suicidal', 'At-risk', 'Normal'];

  List<String> notificationHistory = [
    'Bob seems suicidal. Please check in with him.',
    'Alice needs help.',
  ];

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Therapist Dashboard',
          style: TextStyle(fontSize: 24.0),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              setState(() {
                showNotifications = !showNotifications;
              });
            },
          ),
        ],
      ),
      body: showNotifications
          ? ListView.builder(
        itemCount: notificationHistory.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              notificationHistory[index],
              style: TextStyle(fontSize: 20.0),
            ),
          );
        },
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
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
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columnSpacing: 40.0,
                columns: [
                  DataColumn(label: Text('Patient', style: TextStyle(fontSize: 20.0))),
                  DataColumn(label: Text('Tags', style: TextStyle(fontSize: 20.0))),
                  DataColumn(label: Text('Progress', style: TextStyle(fontSize: 20.0))),
                ],
                rows: filteredPatients.map((patient) {
                  return DataRow(cells: [
                    DataCell(
                      Text(
                        patient['name'],
                        style: TextStyle(fontSize: 18.0),
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
                      Container(
                        width: 150,
                        height: 30,
                        child: LinearProgressIndicator(
                          value: 0.5, // Placeholder value for progress (50%)
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                      ),
                    ),
                  ]);
                }).toList(),
              ),
            ),
          ),
        ],
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
}