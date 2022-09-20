import 'package:flutter/painting.dart';

class AppColors {
  // Basic
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const transparent = Color(0x00000000);

  // App Palette
  static const primary = Color.fromARGB(255, 78, 155, 255);
  static const secondary = Color.fromARGB(255, 22, 0, 53);
  static const cardBackground = Color.fromARGB(136, 59, 144, 255);

  static const darkGrey = Color.fromARGB(255, 43, 43, 62);
  static const lightGrey = Color(0xffE5E5E5);
  static const grey = Color(0xffB3B3C3);

  // Blue Gradient
  static const blueGradient1 = Color(0xff5E94E1);
  static const blueGradient2 = Color(0xff5C91DE);
  static const blueGradient3 = Color(0xff5A8FDB);
  static const blueGradient4 = Color(0xff4271B5);
  static const blueLinearGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.1, 0.15, 0.2, 1.0],
    colors: [AppColors.blueGradient1, AppColors.blueGradient2, AppColors.blueGradient3, AppColors.blueGradient4],
  );
}
