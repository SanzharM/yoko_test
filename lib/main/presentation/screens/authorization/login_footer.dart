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
              GestureDetector(child: const Text('Регистрация')),
              GestureDetector(child: const Text('Забыли пароль?')),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(AppConstraints.padding),
          child: Text('Или войдите через:'),
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
                border: Border.all(),
                borderRadius: AppConstraints.borderRadius,
              ),
              child: Text(
                'G',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(width: AppConstraints.padding),
            Container(
              height: 48,
              width: 48,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(AppConstraints.padding / 2),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: AppConstraints.borderRadius,
              ),
              child: Icon(
                Icons.facebook_rounded,
                size: 24.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
