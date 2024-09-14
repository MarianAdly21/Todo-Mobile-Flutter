import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 329,
      height: 99,
      decoration: BoxDecoration(
        color: AppColors.colorTaskItem,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        leading: CustomIcon(
          onTap: () {},
          assetName: AppAssetPaths.checkBoxIcon,
          width: 24,
          height: 28,
        ),
        title: const Padding(
          padding: EdgeInsetsDirectional.only(
            start: 14,
            top: 12,
          ),
          child: Text(
            "Pay Emma",
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        subtitle: const Padding(
          padding: EdgeInsetsDirectional.only(start: 20, top: 10, bottom: 18),
          child: Text(
            "20 dollars for manga ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        trailing: CustomIcon(
          onTap: () {},
          assetName: AppAssetPaths.trashIcon,
          width: 24,
          height: 27,
        ),
      ),
    );
  }
}
