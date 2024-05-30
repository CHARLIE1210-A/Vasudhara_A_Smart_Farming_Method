import 'package:flutter/material.dart';
import 'presentation/screen/community/community.dart';
import 'presentation/screen/crop_scan/crop_scan.dart';
import 'presentation/screen/home/home_page.dart';
import 'presentation/screen/setting/profile.dart';
import 'presentation/screen/shop/shop_screen.dart';
import 'presentation/screen/splash_screen.dart';

import 'main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VASUDHARA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: CurrentWeather(),
      // initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        // '/': (context) => MainScreen(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/shop': (context) => ShopScreen(),
        '/scan': (context) => CropScanScreen(),
        '/community': (context) => CommunityScreen(),
        '/setting': (context) => const ProfileScreen(),
      },
    );
  }
}
