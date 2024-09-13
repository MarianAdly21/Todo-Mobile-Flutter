import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFF4444),
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
              child: Image.asset(
                'assets/images/todo_image.png',
              ),
            ),
            const SizedBox(height: 102),
            SvgPicture.asset(
              'assets/svg/Group 7.svg',
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
                      color: const Color(0xffFFFFFF).withOpacity(0.5)),
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
                      color: Color(0xffFFFFFF),
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional.centerEnd,
              child: SvgPicture.asset(
                "assets/svg/Vector.svg",
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
