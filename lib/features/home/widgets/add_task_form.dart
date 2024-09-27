import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/add_tasks_cubit.dart/add_tasks_cubit.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/res/app_colors.dart';

class AddTaskForm extends StatefulWidget {
  const AddTaskForm(
      {super.key, required this.isDark, required this.onSavePressed});
  final bool isDark;
  final void Function(TaskModel) onSavePressed;

  @override
  State<AddTaskForm> createState() => _AddTaskFormState();
}

class _AddTaskFormState extends State<AddTaskForm> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, content;
  bool isDone = false;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _customText(title: 'Todo Title'),
          _customTextFormField(
            hintText: "Todo title....",
            textInputAction: TextInputAction.next,
            onSaved: (value) {
              title = value;
            },
          ),
          _customText(title: 'Write anything in your mind'),
          _customTextFormField(
            hintText: "Write anything in your mind",
            textInputAction: TextInputAction.done,
            onFieldSubmitted: (p0) => _addTaskFromBottomSheet(),
            onSaved: (value) {
              content = value;
            },
          ),
          _customButton(
            onTap: () {
              _addTaskFromBottomSheet();
            },
          ),
          const SizedBox(
            height: 31,
          )
        ],
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _customButton({void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 57,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: AppColors.colorButtom,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            "Save",
            style: TextStyle(
              color: widget.isDark ? Colors.black : Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _customTextFormField({
    required String hintText,
    void Function(String?)? onSaved,
    TextInputAction? textInputAction,
    void Function(String)? onFieldSubmitted,
  }) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        top: 10,
        bottom: 23,
      ),
      child: TextFormField(
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is Required";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
          border: _outLineInputBorder(),
          enabledBorder: _outLineInputBorder(),
          focusedBorder: _outLineInputBorder(color: AppColors.colorTaskItem),
        ),
      ),
    );
  }

  Widget _customText({required String title}) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: Color(0xff52525C),
      ),
    );
  }

  OutlineInputBorder _outLineInputBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? AppColors.colorTextField,
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////
  AddTasksCubit get currentAddTasksCubit =>
      BlocProvider.of<AddTasksCubit>(context);

  void _addTask(TaskModel taskModel) {
    currentAddTasksCubit.addTasks(taskModel);
  }

  void _addTaskFromBottomSheet() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      TaskModel taskModel = TaskModel(
        title: title!,
        content: content!,
        isDone: isDone,
      );

      widget.onSavePressed(taskModel);
    } else {
      autovalidateMode = AutovalidateMode.always;
    }
  }
}
