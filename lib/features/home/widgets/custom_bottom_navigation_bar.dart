import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_cubit.dart';
import 'package:todo_mobile/features/home/cubits/tasks_cubit/tasks_state.dart';
import 'package:todo_mobile/features/home/models/task_model.dart';
import 'package:todo_mobile/features/home/widgets/add_task_form.dart';
import 'package:todo_mobile/features/language/configuration_lang.dart';
import 'package:todo_mobile/res/app_colors.dart';
import 'package:todo_mobile/utils/local/app_localization_keys.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onSavePressed,
  });
  final void Function(TaskModel) onSavePressed;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TasksCubit, TasksState>(
      listener: (context, state) {
        if (state is ConvertThemeState) {
          isDark = state.isDark;
        }
      },
      buildWhen: (previous, current) => current is ConvertThemeState,
      builder: (context, state) {
        return Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    const  Icon(
                        Icons.home_outlined,
                        weight: 18,
                        color: AppColors.colorTaskItem,
                      ),
                      Text(
                      ConfagurationLanguage.localization[AppLocalizationKeys.home] ,
                        style:const TextStyle(
                            color: AppColors.colorTaskItem,
                            fontSize: 12,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<TasksCubit>(context).darktheme();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 16),
                    child: isDark
                        ? Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.light_mode_outlined,
                                weight: 18,
                                color: Colors.white,
                              ),
                              Text(
                                ConfagurationLanguage.localization[AppLocalizationKeys.dayLigth],
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          )
                        : Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.nightlight_outlined,
                                weight: 18,
                                color: Colors.black,
                              ),
                              Text(
                                ConfagurationLanguage.localization[AppLocalizationKeys.nightLigth],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                  ),
                )
              ],
            ),
            Positioned(
              top: -20,
              child: FloatingActionButton(
                backgroundColor: AppColors.colorTaskItem,
                shape: const CircleBorder(),
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return _addTaskBottomSheet(context);
                      });
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            )
          ],
        );
      },
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _addTaskBottomSheet(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        start: 24,
        end: 24,
        top: 28,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: AddTaskForm(
          isDark: isDark,
          onSavePressed: (taskModel) {
            widget.onSavePressed(taskModel);
          },
        ),
      ),
    );
  }
}
