import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vasudhara_a_smart_farming_method/presentation/screen/home/components/app_bar.dart';
import 'package:vasudhara_a_smart_farming_method/presentation/screen/home/components/bottom_navigation.dart';

import 'components/categories.dart';
import 'components/discount_banner.dart';
import 'components/home_header.dart';
// import 'components/popular_product.dart';
import 'components/special_offers.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _questionController = TextEditingController();
  String _answer = '';
  bool _showChatScreen = false;

  Future<void> _getAnswer(String question) async {
    // Replace with a real API call and response processing logic
    final response = await http
        .get(Uri.parse('https://your-api.com/answer?question=$question'));
    if (response.statusCode == 200) {
      setState(() {
        _answer = response.body;
      });
    } else {
      setState(() {
        _answer = 'Sorry, I couldn\'t find an answer for that question.';
      });
    }
  }

  void _toggleChatScreen() {
    setState(() {
      _showChatScreen = !_showChatScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: 'Vasudhara', logoPath: 'assets/logo/company.png'),
      endDrawer: CustomDrawer(),
      // body: SafeArea(
      //   child: SingleChildScrollView(
      //     padding: EdgeInsets.symmetric(vertical: 16),
      //     child: Column(
      //       children: [
      //         HomeHeader(),
      //         DiscountBanner(),
      //         Categories(),
      //         SpecialOffers(),
      //         SizedBox(height: 20),
      //         // PopularProducts(),
      //         SizedBox(height: 20),
      //       ],
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          // Main content (hidden when chat screen is visible)
          Visibility(
            visible: !_showChatScreen,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    HomeHeader(),
                    DiscountBanner(),
                    Categories(),
                    SpecialOffers(),
                    SizedBox(height: 20),
                    // PopularProducts(),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),

          // Chat screen (overlayed on top of main content)
          Visibility(
            visible: _showChatScreen,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextField(
                    controller: _questionController,
                    decoration: InputDecoration(
                      labelText: 'Ask your question here...',
                    ),
                    onSubmitted: (question) => _getAnswer(question),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _getAnswer(_questionController.text),
                    child: Text('Get Answer'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    _answer,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleChatScreen,
        child: Icon(_showChatScreen ? Icons.close : Icons.chat),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
