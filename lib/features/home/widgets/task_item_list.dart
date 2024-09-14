import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/widgets/custom_task_item.dart';

class TaskItemList extends StatelessWidget {
  const TaskItemList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 10,
        (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: TaskItem(),
        ),
      ),
    );
  }
}
