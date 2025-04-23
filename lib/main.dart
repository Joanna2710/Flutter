// import 'package:day1_app/screen1.dart';
import 'package:flutter/material.dart';
import 'screen1.dart';
// import 'screen2.dart';
// import 'Screen3.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task Manager App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF00A0B0)),
        useMaterial3: true,
      ),
      home: Screen1(),
    );
  }
}