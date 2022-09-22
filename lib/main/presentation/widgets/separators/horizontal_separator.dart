import 'package:flutter/cupertino.dart';
import 'package:yoko_test/core/constants/app_colors.dart';

class HorizontalSeparator extends StatelessWidget {
  const HorizontalSeparator({Key? key, this.color, this.padding}) : super(key: key);

  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? EdgeInsets.zero,
      color: color ?? AppColors.grey,
      height: 1.0,
      width: double.maxFinite,
    );
  }
}
