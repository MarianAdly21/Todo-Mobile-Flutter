import 'package:flutter/material.dart';

/// to control all colors, app theme, without any need to dig into code
/// any new color or existing color will have a const with its value
/// there is a stand alone variable for any widget, text, image or icon

abstract final class AppColors {
  const AppColors._();

  static const _black = Colors.black;
  static const _white = Colors.white;
  static const _transparent = Colors.transparent;
  static const _red = Colors.red;
  static const _alizarinCrimson = Color(0xffDB2323);
  static const _redsolid = Color(0xffFF0000);
  static const _coralRed = Color(0xffFF4444);
  static const _alto = Color(0xffD9D9D9);
  static const _tamarillo = Color(0xff9D1212);
  static const _altoApprox = Color(0xffD1CDCD);

  /// Splash
  static const splashBackground = _alizarinCrimson;

  /// Home
  static const gridAndListIcon = _redsolid;
  static const colorTaskItem = _coralRed;
    static const colorSearchIcon = _altoApprox;



  /// BottomSheet
  static const colorTextField = _alto;
  static const colorButtom = _tamarillo;
}

///
/// All name colors according to https://chir.ag/projects/name-that-color
///   100% - FF
///   95% - F2
///   90% - E6
///   85% - D9
///   80% - CC
///   75% - BF
///   70% - B3
///   65% - A6
///   60% - 99
///   55% - 8C
///    50% - 80
///    45% - 73
///    40% - 66
///    35% - 59
///   30% - 4D
///   25% - 40
///   20% - 33
///   15% - 26
///   10% - 1A
///    5% - 0D
///   0% - 00
