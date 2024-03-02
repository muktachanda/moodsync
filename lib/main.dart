import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Therapist Chat',
      theme: ThemeData.dark(), // Use dark theme
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
      _messages.insert(0, Message(sender: sender, text: text));
      if (sender == 'User') {
        _messages.insert(0, Message(sender: 'Therapist', text: 'BLACK LIVES MATTER'));
      } else {
        _messages.insert(0, Message(sender: 'User', text: 'Thank you for your advice.'));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat', style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
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
    );
  }

  Widget _buildMessage(Message message) {
    Color bgColor = (message.sender == 'User') ? Colors.blue.shade100 : Colors.green.shade100;
    Color textColor = (message.sender == 'User') ? Colors.black : Colors.black;

    return Align(
      alignment: (message.sender == 'User') ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: Colors.grey, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              message.sender,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: textColor,
                fontSize: 16.0, // Set your desired font size
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              message.text,
              style: TextStyle(
                color: textColor,
                fontSize: 18.0, // Set your desired font size
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
        color: Colors.grey,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                  borderSide: BorderSide.none,
                ),
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
