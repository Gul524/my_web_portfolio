import 'package:flutter/material.dart';
import 'package:my_web_portfolio/pages/homepage/desktop/desktoppage.dart';
import 'package:my_web_portfolio/pages/homepage/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
