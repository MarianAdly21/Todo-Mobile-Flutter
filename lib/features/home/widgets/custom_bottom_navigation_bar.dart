import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/widgets/add_task_form.dart';
import 'package:todo_mobile/res/app_colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.topCenter,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.home_outlined,
                    weight: 18,
                    color: AppColors.colorTaskItem,
                  ),
                  Text(
                    "Home",
                    style: TextStyle(
                        color: AppColors.colorTaskItem,
                        fontSize: 12,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.nightlight_outlined,
                    weight: 18,
                    color: Colors.black,
                  ),
                  Text(
                    "Night Ligth",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
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
      child: const SingleChildScrollView(
        child: AddTaskForm(),
      ),
    );
  }
}
