import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/HomeScreen/provider/provider.dart';
import 'package:weather_app/HomeScreen/view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
