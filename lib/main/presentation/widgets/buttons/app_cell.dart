import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';

class AppCell extends StatelessWidget {
  const AppCell({
    Key? key,
    required this.title,
    this.subtitle,
    this.leading,
    this.icon,
    this.onPressed,
    this.titleStyle,
    this.subtitleStyle,
    this.needBorder = false,
    this.padding,
    this.textAlign,
    this.fillColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final Widget? leading;
  final Widget? icon;
  final String title;
  final TextStyle? titleStyle;
  final String? subtitle;
  final TextStyle? subtitleStyle;
  final bool needBorder;
  final EdgeInsets? padding;
  final TextAlign? textAlign;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: Container(
        padding: padding ?? const EdgeInsets.all(AppConstraints.padding),
        decoration: BoxDecoration(
          color: fillColor,
          borderRadius: AppConstraints.borderRadius,
          border: needBorder ? Border.all(color: AppColors.grey) : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (leading != null)
              Padding(
                padding: const EdgeInsets.only(right: AppConstraints.padding / 2),
                child: leading!,
              ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    textAlign: textAlign,
                    maxLines: 2,
                    style: titleStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w400, letterSpacing: 0),
                  ),
                  if (subtitle?.isNotEmpty ?? false)
                    Text(
                      subtitle!,
                      textAlign: textAlign,
                      maxLines: 2,
                      style: subtitleStyle ?? Theme.of(context).textTheme.bodyMedium?.copyWith(letterSpacing: 0),
                    ),
                ],
              ),
            ),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: AppConstraints.padding / 2),
                child: icon!,
              ),
          ],
        ),
      ),
    );
  }
}
