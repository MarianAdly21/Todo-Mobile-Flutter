import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({
    super.key,
    required this.task,
  });
  final TaskModel task;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  bool isdone = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorTaskItem,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: CustomIcon(
          onTap: () {
            isdone = !isdone;
            setState(() {});
          },
          assetName: AppAssetPaths.checkBoxIcon,
          width: 24,
          height: 28,
          color: isdone ? const Color(0xff12629D) : null,
        ),
        title: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 14,
            top: 12,
          ),
          child: Text(
            widget.task.title,
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
            widget.task.content,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        trailing: CustomIcon(
          onTap: () {
            widget.task.delete();
            BlocProvider.of<TasksCubit>(context).getAllTasks();
          },
          assetName: AppAssetPaths.trashIcon,
          width: 24,
          height: 27,
        ),
      ),
    );
  }
}
