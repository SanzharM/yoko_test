import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(AppConstraints.padding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Регистрация',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.white),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Text(
                  'Забыли пароль?',
                  style: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.white.withOpacity(0.35)),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppConstraints.padding),
          child: Text(
            'Или войдите через:',
            style: Theme.of(context).textTheme.bodyMedium?.apply(color: AppColors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 48,
              width: 48,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(AppConstraints.padding / 2),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                borderRadius: AppConstraints.borderRadius,
              ),
              child: const Text(
                'G',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800, color: AppColors.white),
              ),
            ),
            const SizedBox(width: AppConstraints.padding),
            Container(
              height: 48,
              width: 48,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(AppConstraints.padding / 2),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.white),
                borderRadius: AppConstraints.borderRadius,
              ),
              child: const Icon(
                Icons.facebook_rounded,
                size: 24.0,
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
