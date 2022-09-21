import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoko_test/main/presentation/app_router.dart';

import 'buttons/app_icon_button.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.centerTitle = true,
    this.leading,
    this.automaticallyImplyLeading = false,
    this.needLeading = true,
    this.actions,
    this.overlayStyle,
    this.titleStyle,
  }) : super(key: key);

  final String? title;
  final bool centerTitle;
  final Widget? leading;
  final bool needLeading;
  final bool automaticallyImplyLeading;
  final List<Widget>? actions;
  final SystemUiOverlayStyle? overlayStyle;
  final TextStyle? titleStyle;

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: (title?.isNotEmpty ?? false)
          ? Text(
              title!,
              style: titleStyle ?? Theme.of(context).textTheme.bodyLarge,
            )
          : null,
      centerTitle: centerTitle,
      leading: needLeading
          ? leading ??
              AppIconButton(
                icon: const Icon(Icons.arrow_back_ios_new_sharp),
                onPressed: () => AppRouter.back(context),
              )
          : null,
      automaticallyImplyLeading: automaticallyImplyLeading,
      actions: actions,
      systemOverlayStyle: overlayStyle ?? SystemUiOverlayStyle.dark,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
