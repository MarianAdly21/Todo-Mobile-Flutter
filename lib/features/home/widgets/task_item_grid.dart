import 'package:flutter/material.dart';
import 'package:todo_mobile/features/home/widgets/custom_icon.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class TaskItemGrid extends StatelessWidget {
  const TaskItemGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      sliver: SliverGrid.builder(
        //padding: const EdgeInsets.symmetric(horizontal: 20),
        //   physics: const NeverScrollableScrollPhysics(),
        //  shrinkWrap: true,
        itemCount: 9,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 22,
          mainAxisSpacing: 21,
        ),
        itemBuilder: (context, index) {
          return _taskContant();
        },
      ),
    );
  }

///////////////////////////////////////////////////////////
//////////////////// Widget methods ///////////////////////
///////////////////////////////////////////////////////////

  Widget _taskContant() {
    return Container(
      width: 164,
      // height: 174,
      decoration: BoxDecoration(
        color: AppColors.colorTaskItem,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 9, top: 21, bottom: 21),
            child: Text(
              "Pay Emma",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsetsDirectional.only(start: 17),
            child: Text(
              "20 dollars for manga ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
          const Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomIcon(
                onTap: () {},
                assetName: AppAssetPaths.checkBoxIcon,
                width: 24,
                height: 28,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 10, end: 8),
                child: CustomIcon(
                  onTap: () {},
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
