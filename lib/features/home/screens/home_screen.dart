import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/widgets/custom_bottom_navigation_bar.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/features/home/widgets/task_item_grid.dart';
import 'package:todo_mobile/features/home/widgets/task_item_list.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: _homeAppBarWidget(),
      body: _pageContent(),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _pageContent() {
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

  AppBar _homeAppBarWidget() {
    return AppBar(
      leadingWidth: 90,
      leading: Padding(
          padding: const EdgeInsetsDirectional.only(start: 24, end: 35),
          child: CustomIcon(
            onTap: _onLeadingIconTap,
            assetName: AppAssetPaths.gridViewIcon,
          )),
      title: const Text(
        "My Tasks",
        style: TextStyle(
          color: Color(0xffFF0000),
          fontSize: 32,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 14, end: 27),
          child: CustomIcon(
            onTap: () {},
            assetName: AppAssetPaths.searchIcon,
          ),
        ),
      ],
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Helper methods ///////////////////////
///////////////////////////////////////////////////////////

  void _onLeadingIconTap() {}
}
