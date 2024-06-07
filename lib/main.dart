import 'package:flutter/material.dart';
import 'package:culture_quiz_app/screens/home_screen.dart';

void main() {
  runApp(CultureQuizApp());
}

class CultureQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Culture Quiz Sénégal',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
  }
}
