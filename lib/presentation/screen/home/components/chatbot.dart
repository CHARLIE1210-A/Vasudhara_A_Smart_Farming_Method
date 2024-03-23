import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final Future<String> Function(String) getAnswer; // Function to get answer
  final TextEditingController questionController;
  final VoidCallback onClose; // Function to close the chat screen

  const ChatScreen({
    Key? key,
    required this.getAnswer,
    required this.questionController,
    required this.onClose,
  }) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _answer = '';

  void _submitQuestion(String question) async {
    final response = await widget.getAnswer(question); // Get the answer
    setState(() {
      _answer = response.text();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          // Display conversation history (optional, can be added later)

          TextField(
            controller: widget.questionController,
            decoration: InputDecoration(
              labelText: 'Ask your question here...',
            ),
            onSubmitted: _submitQuestion,
          ),
          SizedBox(height: 10),
          Text(
            _answer,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => _submitQuestion(widget.questionController.text),
            child: Text('Get Answer'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: widget.onClose,
                child: Text('Close'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
