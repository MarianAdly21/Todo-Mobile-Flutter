import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.task, required this.index});
  final TaskModel task;
  final int index;
  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return widget.task.isDone
        ? IconButton(
            onPressed: () async {
              await _updateTask(!widget.task.isDone);
            },
            icon: const Icon(
              Icons.check_box_outlined,
              size: 30,
            ))
        : IconButton(
            onPressed: () async {
              await _updateTask(!widget.task.isDone);
            },
            icon: const Icon(
              Icons.check_box_outline_blank,
              size: 30,
            ));
    // Transform.scale(
    //   scale: 1.3,
    //   child: Checkbox(
    //       side: MaterialStateBorderSide.resolveWith(
    //         (states) => const BorderSide(width: 1, color: Colors.white),
    //       ),
    //       value: widget.task.isDone,
    //       onChanged: (value) async {
    //         await _updateTask(value);
    //       }),
    // );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////

  Future<void> _updateTask(bool? value) async {
    debugPrint("Befor Update ${widget.task.isDone}");
    widget.task.isDone = value!;
    setState(() {});
    await Hive.box<TaskModel>('taskBox').putAt(widget.index, widget.task);
    debugPrint("${widget.task.isDone}");
    debugPrint("After Update ${widget.task.isDone}");
  }
}
