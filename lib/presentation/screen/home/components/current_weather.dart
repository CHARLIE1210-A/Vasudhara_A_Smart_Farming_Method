import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON decoding

class CurrentWeather extends StatefulWidget {
  const CurrentWeather({super.key});

  @override
  State<CurrentWeather> createState() => _CurrentWeatherState();
}

class _CurrentWeatherState extends State<CurrentWeather> {
  double temperature = 0.0;
  String description = '';
  String icon = '';
  double minTemperature = 0.0;
  double maxTemperature = 0.0;
  double pressure = 0.0;
  int? humidity = 0;

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  Future<void> fetchWeather() async {
    final String apiUrl =
        'https://api.openweathermap.org/data/2.5/weather?lat=21.1958756&lon=81.7083096&appid=7ff859ebe582f0ae9eea4ae7722acf0d&units=metric'; // Replace YOUR_CITY with your city

    try {
      final response = await http.get(Uri.parse(apiUrl));
      final data = json.decode(response.body);
      setState(() {
        temperature = data['main']['temp'];
        description = data['weather'][0]['description'];
        icon = data['weather'][0]['icon'];
        minTemperature = data['main']['temp_min'];
        maxTemperature = data['main']['temp_max'];
        pressure = data['main']['pressure'];
        humidity = data['main']['humidity'];
      });
    } catch (e) {
      print('Error fetching weather data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Weather Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Temperature: ${temperature.toStringAsFixed(2)}°C',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Description: $description',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Min Temperature: ${minTemperature.toStringAsFixed(2)}°C',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Max Temperature: ${maxTemperature.toStringAsFixed(2)}°C',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Pressure: $pressure hPa',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Humidity: $humidity %',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
