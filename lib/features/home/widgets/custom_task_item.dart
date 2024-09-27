import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/custom_check_box.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/features/home/widgets/task_item_grid.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.task,
    required this.index,
    required this.onDeleteTap,
  });
  final TaskModel task;
  final int index;

  final void Function() onDeleteTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorTaskItem,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: CustomCheckBox(task: task, index: index),
        title: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 14,
            top: 12,
          ),
          child: Text(
            task.title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        subtitle: Padding(
          padding:
              const EdgeInsetsDirectional.only(start: 20, top: 10, bottom: 18),
          child: Text(
            task.content,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        trailing: CustomIcon(
          onTap: onDeleteTap,
          assetName: AppAssetPaths.trashIcon,
          width: 24,
          height: 27,
        ),
      ),
    );
  }
}
