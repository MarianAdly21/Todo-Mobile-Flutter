import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/widgets/task_item_list.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsetsDirectional.only(
                start: 20, end: 39, top: 49, bottom: 27),
            child: Text(
              'Whats on your mind?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xffF97D7D),
              ),
            ),
          ),
        ),
        TaskItemList(),
      ],
    );
  }
}
