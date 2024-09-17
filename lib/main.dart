import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/screens/home_screen.dart';
import 'package:todo_mobile/simple_bloc_observer.dart';



void main() async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>("taskBox");

  runApp(const TodoApp());
}



class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
