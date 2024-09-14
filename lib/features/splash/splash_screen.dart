import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_mobile/features/home/screens/home_screen.dart';
import 'package:todo_mobile/res/app_asset_paths.dart';
import 'package:todo_mobile/res/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) =>const HomeScreen()));
    });
    return Scaffold(
      backgroundColor: AppColors.splashBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 35),
        child: Column(
          children: [
            const Text(
              "My Tasks",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "مهامي",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 48),
            Expanded(
              child: Image.asset(AppAssetPaths.appLogo),
            ),
            const SizedBox(height: 102),
            SvgPicture.asset(
              AppAssetPaths.lineSplashIcon,
              height: 71,
              width: 215,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 23),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Good',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                      color: Colors.white.withOpacity(0.5)),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.only(start: 18),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  'Consistancy',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: SvgPicture.asset(
                AppAssetPaths.cupSplashIcon,
                width: 50,
                height: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}
