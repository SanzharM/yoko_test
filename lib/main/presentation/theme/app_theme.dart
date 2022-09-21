import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';

class AppTheme {
  static const _iconTheme = IconThemeData(color: AppColors.black, size: 24.0);

  ThemeData get defaultTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        backgroundColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: _iconTheme,
        ),
        iconTheme: _iconTheme,
        fontFamily: AppStyles.fontFamily,
        textTheme: const TextTheme(
          // Headlines
          headlineLarge: AppStyles.headlineLarge,
          headlineMedium: AppStyles.headlineMedium,
          headlineSmall: AppStyles.headlineSmall,
          // Titles
          titleLarge: AppStyles.titleLarge,
          titleMedium: AppStyles.titleMedium,
          titleSmall: AppStyles.titleSmall,
          // Labels
          labelLarge: AppStyles.labelLarge,
          labelMedium: AppStyles.labelMedium,
          labelSmall: AppStyles.labelSmall,
          // Bodies
          bodyLarge: AppStyles.bodyLarge,
          bodyMedium: AppStyles.bodyMedium,
          bodySmall: AppStyles.bodySmall,
          // Displays
          displayLarge: AppStyles.bodyLarge,
          displayMedium: AppStyles.bodyMedium,
          displaySmall: AppStyles.bodySmall,
        ).apply(
          bodyColor: AppColors.black,
          displayColor: AppColors.black,
        ),
        cupertinoOverrideTheme: const NoDefaultCupertinoThemeData(
          primaryColor: AppColors.black,
          scaffoldBackgroundColor: AppColors.white,
          textTheme: CupertinoTextThemeData(
            primaryColor: AppColors.black,
          ),
        ),
      );
}
