import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.title,
    this.onPressed,
    this.isLoading = false,
    this.padding,
    this.alignment,
    this.textStyle,
    this.textColor,
    this.backgroundColor,
  }) : super(key: key);

  final String title;
  final void Function()? onPressed;
  final bool isLoading;

  final Alignment? alignment;
  final EdgeInsets? padding;
  final TextStyle? textStyle;

  final Color? textColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      borderRadius: AppConstraints.borderRadius,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: AppConstraints.borderRadius,
          gradient: backgroundColor == null ? const LinearGradient(colors: [AppColors.blueGradient4, AppColors.blueGradient1]) : null,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: isLoading
              ? Center(
                  child: Padding(
                  padding: padding ?? const EdgeInsets.all(14.0),
                  child: CupertinoActivityIndicator(
                    color: textColor ?? AppColors.white,
                  ),
                ))
              : Container(
                  width: double.maxFinite,
                  alignment: alignment ?? Alignment.center,
                  padding: padding ?? const EdgeInsets.all(AppConstraints.padding),
                  child: Text(
                    title,
                    style: textStyle ?? Theme.of(context).textTheme.bodyLarge?.apply(color: textColor ?? AppColors.white),
                  ),
                ),
        ),
      ),
    );
  }
}
