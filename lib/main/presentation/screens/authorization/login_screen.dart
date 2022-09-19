import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoko_test/core/constants/constants.dart';
import 'package:yoko_test/main/presentation/widgets/app_text_field.dart';
import 'package:yoko_test/main/presentation/widgets/buttons/app_button.dart';
import 'package:yoko_test/main/presentation/widgets/buttons/app_icon_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscured = true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).hasFocus ? () => FocusScope.of(context).unfocus() : null,
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(AppConstraints.padding),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.15, 0.2, 1.0],
              colors: [
                AppColors.blueGradient1,
                AppColors.blueGradient2,
                AppColors.blueGradient3,
                AppColors.blueGradient4,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppBar().preferredSize.height),
              Text(
                'Добро пожаловать,\nАвторизуйтесь',
                style: Theme.of(context).textTheme.headlineMedium?.apply(color: AppColors.white),
              ),
              const SizedBox(height: AppConstraints.padding * 2),
              AppTextField(
                hintText: 'E-mail',
                text: '',
                onTap: () => setState(() {}),
                onChanged: (value) {},
              ),
              const SizedBox(height: AppConstraints.padding),
              AppTextField(
                hintText: 'Пароль',
                text: '',
                maxLines: 1,
                isObscured: isObscured,
                icon: AppIconButton(
                  icon: Icon(
                    isObscured ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
                    color: AppColors.white,
                  ),
                  onPressed: () => setState(() => isObscured = !isObscured),
                ),
              ),
              const SizedBox(height: AppConstraints.padding * 2),
              AppButton(
                title: 'Войти',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
