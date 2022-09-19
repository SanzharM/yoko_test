import 'package:flutter/cupertino.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.padding,
  }) : super(key: key);

  final Widget icon;
  final void Function() onPressed;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: padding ?? EdgeInsets.zero,
      child: icon,
    );
  }
}
