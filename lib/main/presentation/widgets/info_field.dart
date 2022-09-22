import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';

class InfoField extends StatelessWidget {
  const InfoField({Key? key, required this.title, required this.value}) : super(key: key);

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.displaySmall?.apply(color: AppColors.grey),
        ),
      ],
    );
  }
}
