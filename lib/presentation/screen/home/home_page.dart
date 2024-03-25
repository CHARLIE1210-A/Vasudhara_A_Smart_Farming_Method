import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vasudhara_a_smart_farming_method/presentation/screen/home/components/app_bar.dart';
import 'components/discount_banner.dart';
import 'components/farming_features.dart';
import 'components/home_header.dart';

final features = [
  const FarmingFeature(
    title: 'Soil Analysis',
    icon: Icons.science,
  ),
  const FarmingFeature(
    title: 'Crop Irrigation',
    icon: Icons.water_damage,
  ),
  const FarmingFeature(
    title: 'Crop Management',
    icon: Icons.agriculture,
  ),
  const FarmingFeature(
    title: 'Disease Control',
    icon: Icons.bug_report,
  ),
  const FarmingFeature(
    title: 'Smart Greenhouses',
    icon: Icons.eco,
  ),
  const FarmingFeature(
    title: 'Remote Sensing',
    icon: Icons.airplanemode_active_outlined,
  ),
  const FarmingFeature(
    title: 'Financial Analytics',
    icon: Icons.analytics_outlined,
  ),
  const FarmingFeature(
    title: 'Connect Device',
    icon: Icons.device_hub,
  ),
  // ... Add features with  icons
];

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
      body: Stack(
        children: [
          // Main content (hidden when chat screen is visible)
          Visibility(
            visible: !_showChatScreen,
            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Column(
                  children: [
                    const HomeHeader(),
                    const DiscountBanner(),
                    SizedBox(
                        height: 400,
                        child: FarmingFeatures(features: features)),
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
                    decoration: const InputDecoration(
                      labelText: 'Ask your question here...',
                    ),
                    onSubmitted: (question) => _getAnswer(question),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => _getAnswer(_questionController.text),
                    child: const Text('Get Answer'),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _answer,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // body: FarmingFeatures(features: features),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleChatScreen,
        child: Icon(_showChatScreen ? Icons.close : Icons.chat),
      ),
      // bottomNavigationBar: BottomNavBar(),
    );
  }
}
