import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/welcome_screen.dart';

  bool swiftcolor = false;

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent));
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData dark = ThemeData(brightness: Brightness.dark);
  ThemeData light  = ThemeData(brightness: Brightness.light);
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  WelcomeScreen());
  }
}