import 'package:flutter/material.dart';

void main() {
  runApp(ChatBox());
}

class ChatBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  @override
  State createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final List<Message> _messages = [];

  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text, String sender) {
    _textController.clear();
    setState(() {
      if (sender == 'Therapist') {
        _messages.insert(0, Message(sender: 'Therapist', text: text));
        // Simulate a response from the user (you can replace this logic)
        _messages.insert(0, Message(sender: 'User', text: 'Thank you for your advice.'));
      } else {
        _messages.insert(0, Message(sender: 'User', text: text));
        // Simulate a response from the therapist (you can replace this logic)
        _messages.insert(0, Message(sender: 'Therapist', text: 'Hi, how can I help you?'));
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Therapist'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true, // Display new messages at the bottom
              itemCount: _messages.length,
              itemBuilder: (_, index) => _buildMessage(_messages[index]),
            ),
          ),
          _buildComposer(),
        ],
      ),
    );
  }

  Widget _buildMessage(Message message) {
    Color bgColor;
    String label;
    if (message.sender == 'Therapist') {
      bgColor = Colors.blue.shade100; // Blue for therapist's messages
      label = 'Therapist';
    } else {
      bgColor = Colors.green.shade100; // Green for user's messages
      label = 'User';
    }

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            message.text,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComposer() {
    return Container(
      color:Colors.grey,
      padding: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration.collapsed(
                hintText: 'Type your message...',
              ),
              onSubmitted: (text) => _handleSubmitted(text, 'User'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text, 'User'),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});
}
