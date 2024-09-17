import 'package:flutter/material.dart';
import 'package:flutter1/layouts/bottom_navigation_bar.dart'; // Import BottomNavigationBar layout

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stok Alat Tulis',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyBottomNavigationBar(), // Set BottomNavigationBar as home
    );
  }
}
