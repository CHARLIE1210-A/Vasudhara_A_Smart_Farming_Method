import 'package:flutter/material.dart';
import '../../../mybot.dart';
import 'components/app_bar.dart';
// import 'components/discount_banner.dart';
import 'components/farming_features.dart';
// import 'components/home_header.dart';
import 'components/weather.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(title: 'Vasudhara', logoPath: 'assets/logo/company.png'),
      endDrawer: CustomDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              // const HomeHeader(),
              // const DiscountBanner(),
              const WeatherCard(),
              SizedBox(height: 400, child: FarmingFeatures(features: features)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Mybot()),
          );
        },
        child: const Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
