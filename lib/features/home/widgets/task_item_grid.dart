import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/custom_check_box.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class TaskItemGrid extends StatelessWidget {
  const TaskItemGrid({
    super.key,
    required this.tasks,
    required this.onDeleteTap,
    required this.onDonePressed,
  });
  final List<TaskModel> tasks;
  final void Function(int) onDeleteTap;
  final void Function(TaskModel task, int indexOfTask) onDonePressed;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid.builder(
        itemCount: tasks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 22,
          mainAxisSpacing: 21,
          childAspectRatio: 0.94,
        ),
        itemBuilder: (context, index) {
          return _taskContant(
            task: tasks[index],
            context,
            index: index,
          );
        },
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _taskContant(BuildContext context,
      {required int index, required TaskModel task}) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.colorTaskItem,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(start: 9, top: 21, bottom: 21),
            child: Text(
              task.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 17, end: 17),
              child: Text(
                task.content,
                maxLines: 2,
                style: const TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomCheckBox(
                task: task,
                onDonePressed: () => onDonePressed(task, index),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 8),
                child: CustomIcon(
                  onTap: () => onDeleteTap(index),
                  assetName: AppAssetPaths.trashIcon,
                  width: 24,
                  height: 27,
                ),
              ),
            ],
          ),
          const SizedBox(height: 9),
        ],
      ),
    );
  }
}
