import 'package:flutter/material.dart';

import 'package:todo_mobile/features/home/models/task_model.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.task, required this.onDonePressed});
  final TaskModel task;

  final void Function() onDonePressed;
  @override
  Widget build(BuildContext context) {
    return task.isDone
        ? IconButton(
            onPressed: onDonePressed,
            icon: const Icon(
              Icons.check_box_outlined,
              size: 30,
              color: Colors.white,
            ))
        : IconButton(
            onPressed: onDonePressed,
            icon: const Icon(
              Icons.check_box_outline_blank,
              size: 30,
              color: Colors.white,
            ));
  }
}
