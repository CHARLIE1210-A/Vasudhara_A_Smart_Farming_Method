import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Onboarding Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OnboardingScreen(),
    );
  }
}

class OnboardingScreen extends StatelessWidget {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _controller,
        children: <Widget>[
          _buildPage(
              'Enjoy', 'Enjoy the various features we offer!', Colors.blue),
          _buildPage('Get Started', 'Let\'s get started!', Colors.red),
          _buildPage(
              'Stay Connected', 'Stay connected with us!', Colors.orange),
          _buildPage(
              'Thank You', 'Thank you for choosing our app!', Colors.purple),
          _buildPage('Welcome', 'Welcome to our app!', Colors.green),
          _buildPage(
              'Enjoy', 'Enjoy the various features we offer!', Colors.blue),
          _buildPage('Get Started', 'Let\'s get started!', Colors.red),
        ],
      ),
    );
  }

  Widget _buildPage(String title, String description, Color color) {
    return Container(
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20),
          Text(
            description,
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
