import 'package:flutter/material.dart';

class Message {
  final String sender;
  final String text;

  Message({required this.sender, required this.text});

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'],
      text: json['text'],
    );
  }
}

class MessageService {
  static List<Message> messages = [];
}
