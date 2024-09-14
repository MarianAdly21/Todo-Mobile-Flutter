import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/widgets/custom_bottom_navigationbar.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/features/home/widgets/home_screen_body.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavigationBar(),
      appBar: AppBar(
        leadingWidth: 90,
        leading: Padding(
            padding: const EdgeInsetsDirectional.only(start: 24, end: 35),
            child: CustomIcon(
              onTap: () {},
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
      ),
      body: const HomeScreenBody(),
    );
  }
}
