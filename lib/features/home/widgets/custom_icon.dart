import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({
    super.key,
    required this.onTap,
    this.width,
    this.height,
    required this.assetName,
    this.color,
  });
  final void Function() onTap;
  final double? width, height;
  final String assetName;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(assetName,
          height: height,
          width: width,
          colorFilter:
              ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn)),
    );
  }
}
