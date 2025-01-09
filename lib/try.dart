import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WhatsApp Clone'),
        ),
        body: ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<String> messages = [
    "استة بيتكلم",
    "واللغتهمامتاممةاحمحاحاخحاحاحاحل الالا",
    "10:54 pm",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: messages.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage('assets/samuel_magdy.jpg'), // تأكد من إضافة الصورة إلى مجلد assets
          ),
          title: Text('Samuel Magdy'),
          subtitle: Text(messages[index]),
          trailing: Text('10:54 pm'),
        );
      },
    );
  }
}