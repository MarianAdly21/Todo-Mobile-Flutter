import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_mobile/features/home/screens/home_screen.dart';

void main() async {
  await Hive.initFlutter();
 await Hive.openBox("noteBox");

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
