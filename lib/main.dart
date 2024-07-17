import 'package:flutter/material.dart';
import 'presentation/screen/community/community.dart';
import 'presentation/screen/crop_scan/crop_scan.dart';
import 'presentation/screen/home/home_page.dart';
import 'presentation/screen/setting/profile.dart';
import 'presentation/screen/shop/cart_model.dart';
import 'presentation/screen/shop/shop_screen.dart';
import 'presentation/screen/splash_screen.dart';

import 'package:provider/provider.dart';

import 'main_screen.dart';

import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
        primarySwatch: Colors.green,
        textTheme: GoogleFonts.nunitoTextTheme(
          Theme.of(context).textTheme,
        ),
        // primaryColor: Colors.green,
      ),
      // home: CurrentWeather(),
      // initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        // '/': (context) => MainScreen(),
        '/main': (context) => const MainScreen(),
        '/home': (context) => const HomeScreen(),
        '/shop': (context) => const ShopScreen(),
        // '/scan': (context) => const CropScanScreen(),
        '/community': (context) => const CommunityScreen(),
        '/setting': (context) => const ProfileScreen(),
      },
    );
  }
}
