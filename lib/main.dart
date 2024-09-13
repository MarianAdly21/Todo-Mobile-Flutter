import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/home_screen.dart';
import 'package:todo_mobile/features/splash/splash_screen.dart';

void main() {
  runApp(const TodoApp());
}

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
