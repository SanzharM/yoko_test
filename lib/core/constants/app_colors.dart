import 'package:flutter/painting.dart';

class AppColors {
  // Basic
  static const white = Color(0xffFFFFFF);
  static const black = Color(0xff000000);
  static const transparent = Color(0x00000000);

  // Blue Gradient
  static const blueGradient1 = Color(0xff5E94E1);
  static const blueGradient2 = Color(0xff5C91DE);
  static const blueGradient3 = Color(0xff5A8FDB);
  static const blueGradient4 = Color(0xff4271B5);

  // Grey
  static const grey = Color(0xffDADADA);
  static const greyLight = Color(0xffF9FAFC);

  // Gradients
  static const blueLinearGradient = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [0.1, 0.15, 0.2, 1.0],
    colors: [AppColors.blueGradient1, AppColors.blueGradient2, AppColors.blueGradient3, AppColors.blueGradient4],
  );
  static final blackBlueGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.25, 0.75, 1.0],
    colors: [
      AppColors.black.withOpacity(0.7),
      AppColors.transparent,
      AppColors.blueGradient1.withOpacity(0.7),
    ],
  );
  static final blackShadowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: const [0.25, 0.75, 1.0],
    colors: [
      AppColors.black.withOpacity(0.7),
      AppColors.transparent,
      AppColors.black.withOpacity(0.7),
    ],
  );
  static final blueShadowGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      AppColors.blueGradient1.withOpacity(0.3),
      AppColors.blueGradient4.withOpacity(0.3),
    ],
  );
}
