import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/report.dart';

Future<Map<String, dynamic>> fetchWeatherData() async {
  final apiKey = 'c5df3c967ade4911a9e122939232805';
  final cityName = 'Gopichettipalaiyam';

  final url = Uri.parse('https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body) as Map<String, dynamic>;
    return data;
  } else {
    throw Exception('Failed to fetch weather data');
  }
}
