import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weatherModel.dart';

class WeatherData{
  Future<Weather> getData(var latitute,var longitute) async {
    var uricall = Uri.parse('http://api.weatherapi.com/v1/current.json?key=c5df3c967ade4911a9e122939232805&q=$latitute.$longitute&aqi=no');
    var response  = await http.get(uricall);
    var body = jsonDecode(response.body);
    return Weather.fromJson(body);
  }
}