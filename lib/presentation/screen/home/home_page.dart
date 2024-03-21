import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: 'Vasudhara', logoPath: 'assets/logo/company.jpeg'),
      endDrawer: CustomDrawer(),
      body: SafeArea(
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
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
