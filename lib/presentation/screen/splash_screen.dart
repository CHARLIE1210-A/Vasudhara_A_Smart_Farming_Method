import "package:flutter/material.dart";
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'home/home_page.dart';
import '../../presentation/screen/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(seconds: 6), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const OnBoarding()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Image.asset('assets/logo/company.png'),
            const SizedBox(height: 20.0),
            Center(
              child: SvgPicture.asset(
                'assets/logo/download.svg',
                width: 700,
                height: 700,
                colorFilter:
                    const ColorFilter.mode(Colors.black, BlendMode.srcIn),
              ),
            ), // replace with your image
            const SizedBox(height: 50.0),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  'Created & Maintained by',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black87),
                ),
                Text(
                  'SINGH Technologies',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.amita(
                      fontStyle: FontStyle.italic, color: Colors.black),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
