import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/custom_task_item.dart';

class TaskItemList extends StatelessWidget {
  const TaskItemList(
      {super.key, required this.task, required this.onDeleteTap});
  final List<TaskModel> task;

  final void Function(int) onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: task.length,
        (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: TaskItem(
            index: index,
            task: task[index],
            onDeleteTap: () => onDeleteTap(index),
          ),
        ),
      ),
    );
  }
}
