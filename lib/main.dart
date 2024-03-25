import 'package:flutter/material.dart';
import 'package:vasudhara_a_smart_farming_method/presentation/screen/community/community.dart';
import 'package:vasudhara_a_smart_farming_method/presentation/screen/crop_scan/crop_scan.dart';
import 'package:vasudhara_a_smart_farming_method/presentation/screen/home/home_page.dart';
import 'package:vasudhara_a_smart_farming_method/presentation/screen/setting/setting.dart';
import 'package:vasudhara_a_smart_farming_method/presentation/screen/shop/shop_screen.dart';
import 'package:vasudhara_a_smart_farming_method/presentation/screen/splash_screen.dart';

import 'main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'VASUDHARA',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        // '/': (context) => MainScreen(),
        '/main': (context) => MainScreen(),
        '/home': (context) => HomeScreen(),
        '/shop': (context) => ShopScreen(),
        '/scan': (context) => CropScanScreen(),
        '/community': (context) => CommunityScreen(),
        '/setting': (context) => SettingScreen(),
      },
    );
  }
}
