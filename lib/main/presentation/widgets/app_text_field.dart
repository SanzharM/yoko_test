import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    Key? key,
    required this.text,
    this.label,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.needValidator = true,
    this.readonly = false,
    this.isObscured = false,
    this.hintText,
    this.hintStyle,
    this.inputType = TextInputType.text,
    this.maxLength,
    this.maxLines,
    this.prefix,
    this.prefixIcon,
    this.icon,
  }) : super(key: key);

  final String? text;
  final String? label;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final bool needValidator;
  final bool readonly;
  final bool isObscured;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextInputType inputType;
  final int? maxLength;
  final int? maxLines;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? icon;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: AppConstraints.borderRadius,
            border: Border.all(
              color: AppColors.white.withOpacity(0.4),
              width: 1.0,
            ),
          ),
          child: TextFormField(
            controller: controller,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            onEditingComplete: widget.onEditingComplete ?? () => FocusScope.of(context).nextFocus(),
            keyboardType: widget.inputType,
            maxLength: widget.maxLength ?? 300,
            maxLines: widget.maxLines,
            obscureText: widget.isObscured,
            readOnly: widget.readonly,
            validator: widget.needValidator ? _textValidator : null,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(decoration: TextDecoration.none, color: AppColors.white),
            decoration: InputDecoration(
              labelText: widget.label,
              labelStyle: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.white.withOpacity(0.5)),
              floatingLabelStyle: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.white.withOpacity(0.5)),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              hintText: widget.hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.white.withOpacity(0.5)),
              border: InputBorder.none,
              focusColor: AppColors.white,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              counterText: '',
              errorBorder: InputBorder.none,
              prefix: widget.prefix,
              prefixIcon: widget.prefixIcon,
              fillColor: AppColors.secondary,
            ),
          ),
        ),
        if (widget.icon != null)
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: widget.icon!,
            ),
          ),
      ],
    );
  }

  String? _textValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return '';
    }
    return null;
  }
}
