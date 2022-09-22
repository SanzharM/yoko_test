import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yoko_test/core/constants/constants.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key, this.isLoading = false, required this.child}) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isLoading
          ? Shimmer.fromColors(
              child: child,
              baseColor: AppColors.white,
              highlightColor: AppColors.grey,
            )
          : child,
    );
  }
}
