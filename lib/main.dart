import 'package:demo_project/presentation/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

/// Entry point of the Flutter application.
void main() {
  runApp(const MyApp());
}

/// Root widget of the application.
/// This widget wraps the app with [MaterialApp] and sets up the home page.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Web Task', // Sets the application title
      debugShowCheckedModeBanner: false, // Hides the debug banner
      home: HomePage(), // Sets the initial screen to HomePage
    );
  }
}
