import 'dart:convert';

import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Mybot extends StatefulWidget {
  const Mybot({super.key});

  @override
  State<Mybot> createState() => _MybotState();
}

class _MybotState extends State<Mybot> {
  ChatUser myself = ChatUser(id: '1', firstName: 'ashu');
  ChatUser bot = ChatUser(id: '2', firstName: 'Assistant');

  List<ChatMessage> allMessages = [];
  List<ChatUser> typing = [];
  final oururl =
      'https://generativelanguage.googleapis.com/v1beta/models/gemini-pro:generateContent?key=AIzaSyCPVWzopKsAxYjwakAklSiN64wAAWA1VZo';

  final header = {'Content-Type': 'application/json'};

  getdata(ChatMessage m) async {
    typing.add(bot);
    allMessages.insert(0, m);
    setState(() {});

    var data = {
      "contents": [
        {
          "parts": [
            {"text": m.text}
          ]
        }
      ]
    };

    await http
        .post(Uri.parse(oururl), headers: header, body: jsonEncode(data))
        .then((value) {
      if (value.statusCode == 200) {
        var result = jsonDecode(value.body);
        print(result['candidates'][0]['content']['parts'][0]['text']);

        ChatMessage m1 = ChatMessage(
            text: result['candidates'][0]['content']['parts'][0]['text'],
            user: bot,
            createdAt: DateTime.now());

        allMessages.insert(0, m1);
        setState(() {});
      } else {
        print("error");
      }
    }).catchError((e) {});
    typing.remove(bot);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DashChat(
          typingUsers: typing,
          currentUser: myself,
          onSend: (ChatMessage m) {
            getdata(m);
          },
          messages: allMessages),
    );
  }
}
