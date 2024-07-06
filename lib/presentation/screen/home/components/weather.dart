import 'package:flutter/material.dart';
import '../../shop/cart.dart';
import 'icon_btn_with_counter.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on, color: Colors.grey),
                      const SizedBox(width: 4),
                      const Text('Mujgahahan,Dhamtari',
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 52),
                      // IconBtnWithCounter(
                      //   svgSrc: "assets/icons/Cart Icon.svg",
                      //   press: () {},
                      //   //   press: () => Navigator.pushNamed(context, CartScreen.routeName),
                      // ),
                      const SizedBox(width: 45),
                      IconBtnWithCounter(
                        svgSrc: "assets/icons/Bell.svg",
                        numOfitem: 3,
                        // press: () {},
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                  // Icon(Icons.notifications, color: Colors.grey),
                ],
              ),
              const SizedBox(height: 20),
              Image.asset('assets/icons/cloudy.png',
                  width: 80, height: 80), // Add your weather icon
              const SizedBox(height: 20),
              const Text('31°C',
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold)),
              const Text('Today is partly sunny day!',
                  style: TextStyle(fontSize: 16, color: Colors.grey)),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  WeatherDetail(title: 'Humidity', value: '77%'),
                  WeatherDetail(title: 'Precipitation', value: '< 0.01 in'),
                  WeatherDetail(title: 'Wind Speed', value: '6 mph/s'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  final String title;
  final String value;

  const WeatherDetail({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }
}
