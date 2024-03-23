import 'package:flutter/material.dart';
import 'presentation/screen/splash_screen.dart';
import 'package:google_generative_ai/google_generative_ai.dart'; // Import for Gemini API

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'QnA Chatbot with Gemini',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   final TextEditingController _questionController = TextEditingController();
//   List<String> _conversationHistory = []; // List to store conversation history
//   String _answer = '';
//   final String _apiKey = "YOUR_API_KEY"; // Replace with your actual API key
//   bool _showChatScreen = false; // Flag to control chat screen visibility

//   Future<void> _getAnswer(String question) async {
//     // final genAI = GoogleGenerativeAI(_apiKey);
//     // final genModel = await genAI.getGenerativeModel(model: "gemini-pro");

//     final model = GenerativeModel(model: 'gemini-pro', apiKey: _apiKey);
//     final content = [Content.text(question)];
//     final response = await model.generateContent(content);
//     // Use sendMessageStream for conversational flow
//     // final responseStream = model.sendMessageStream(
//     //   content: Content.text(question),
//     //   stream: true,
//     // );

//     // // Get the first response from the stream
//     // final response = await responseStream.first;

//     setState(() {
//       _conversationHistory.add(question); // Add user question to history
//       _conversationHistory
//           .add(response.text!); // Add generated answer to history
//       _answer = response.text!;
//     });
//   }

//   void _toggleChatScreen() {
//     setState(() {
//       _showChatScreen = !_showChatScreen;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('QnA Chatbot'),
//       ),
//       body: Stack(
//         children: [
//           // Main content (hidden when chat screen is visible)
//           Visibility(
//             visible: !_showChatScreen,
//             child: Center(
//               child: Text(
//                 'Click the chat button to ask questions!',
//                 style: TextStyle(fontSize: 16),
//               ),
//             ),
//           ),

//           // Chat screen (overlayed on top of main content)
//           Visibility(
//             visible: _showChatScreen,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Column(
//                 children: [
//                   // Display conversation history
//                   Expanded(
//                     child: ListView.builder(
//                       reverse: true, // Display latest messages at the top
//                       itemCount: _conversationHistory.length,
//                       itemBuilder: (context, index) => Text(
//                         _conversationHistory[index],
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ),

//                   SizedBox(height: 10),
//                   TextField(
//                     controller: _questionController,
//                     decoration: InputDecoration(
//                       labelText: 'Ask your question here...',
//                     ),
//                     onSubmitted: (question) => _getAnswer(question),
//                   ),
//                   SizedBox(height: 10),
//                   ElevatedButton(
//                     onPressed: () => _getAnswer(_questionController.text),
//                     child: Text('Get Answer'),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     _answer,
//                     style: TextStyle(fontSize: 16),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _toggleChatScreen,
//         child: Icon(_showChatScreen ? Icons.close : Icons.chat),
//       ),
//     );
//   }
// }
