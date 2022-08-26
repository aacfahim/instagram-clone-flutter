import 'package:flutter/material.dart';
import 'package:instagram_clone/common/bottom_nav_bar.dart';
import 'package:instagram_clone/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const BottomNavBar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
