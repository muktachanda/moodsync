import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moodsync/therapist/dashboard.dart';
import 'package:moodsync/therapist/dashboard.dart';
import '../message_service.dart';
import 'dart:convert';
import '../therapist/dashboard.dart';
import '../therapist/dashboard.dart';

class PatientChatScreen extends StatefulWidget {
  @override
  State createState() => PatientChatScreenState();
}

class PatientChatScreenState extends State<PatientChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Message> _messages = [];

  @override
  void initState() {
    super.initState();
    // Fetch messages from the backend when the screen initializes
    fetchMessages();
  }

  Future<void> fetchMessages() async {
    try {
      final response = await http.get(Uri.parse('http://localhost:5000/api/messages'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        setState(() {
          _messages = data.map((message) => Message(sender: message['sender'], text: message['text'])).toList();
          _messages = _messages.reversed.toList();
        });
      } else {
        print('Failed to fetch messages: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching messages: $e');
    }
  }

  void _handleSubmitted(String text) async {
    _textController.clear();
    setState(() {
      _messages.add(Message(sender: 'User', text: text)); // Append new message to the end
    });

    try {
      final response = await http.post(
        Uri.parse('http://localhost:5000/api/data'),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'sender': 'User',
          'text': text,
        }),
      );
      if (response.statusCode != 200) {
        print('Failed to send message: ${response.statusCode}');
      } else {
        // Call the endpoint to run detection
        await http.post(Uri.parse('http://localhost:5000/api/run_detection'));

      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Patient Chat',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Colors.black,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(8.0),
                reverse: true,
                itemCount: _messages.length,
                itemBuilder: (_, index) => _buildMessage(_messages[index]),
              ),
            ),
            _buildComposer(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessage(Message message) {
    final bgColor = message.sender == 'User' ? Colors.green.shade200 : Colors.blue.shade200;
    final textColor = message.sender == 'User' ? Colors.black : Colors.black;
    final alignment = message.sender == 'User' ? CrossAxisAlignment.end : CrossAxisAlignment.start;

    return Align(
      alignment: (message.sender == 'Therapist') ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey.shade700, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: alignment,
          children: [
            Text(
              message.sender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              message.text,
              style: TextStyle(
                color: textColor,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade800,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Type your message...',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
              ),
              onSubmitted: _handleSubmitted,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send, color: Colors.white),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }
}
