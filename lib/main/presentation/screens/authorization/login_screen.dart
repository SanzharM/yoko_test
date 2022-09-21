import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yoko_test/core/constants/constants.dart';
import 'package:yoko_test/core/services/alert_controller.dart';
import 'package:yoko_test/main/domain/blocs/authorization/authorization_bloc.dart';
import 'package:yoko_test/main/presentation/app_router.dart';
import 'package:yoko_test/main/presentation/screens/authorization/login_footer.dart';
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
  late AuthorizationBloc bloc;

  String? _login;
  String? _password;

  @override
  void initState() {
    super.initState();
    bloc = context.read<AuthorizationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).hasFocus ? () => FocusScope.of(context).unfocus() : null,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          padding: const EdgeInsets.all(AppConstraints.padding),
          width: double.maxFinite,
          decoration: const BoxDecoration(
            gradient: AppColors.blueLinearGradient,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: AppBar().preferredSize.height),
              Padding(
                padding: const EdgeInsets.only(right: AppConstraints.padding * 2),
                child: Text(
                  'Добро пожаловать,\nАвторизуйтесь',
                  style: Theme.of(context).textTheme.headlineMedium?.apply(color: AppColors.white),
                ),
              ),
              const SizedBox(height: AppConstraints.padding * 2),
              AppTextField(
                hintText: 'E-mail',
                text: _login,
                onTap: () => setState(() {}),
                onChanged: (value) => setState(() => _login = value),
              ),
              const SizedBox(height: AppConstraints.padding),
              AppTextField(
                hintText: 'Пароль',
                text: _password,
                maxLines: 1,
                isObscured: isObscured,
                icon: AppIconButton(
                  icon: Icon(
                    isObscured ? CupertinoIcons.eye_slash_fill : CupertinoIcons.eye_fill,
                    color: AppColors.white,
                  ),
                  onPressed: () => setState(() => isObscured = !isObscured),
                ),
                onChanged: (value) => setState(() => _password = value),
              ),
              const SizedBox(height: AppConstraints.padding * 2),
              BlocConsumer<AuthorizationBloc, AuthorizationState>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is LoginErrorState) {
                    AlertController.showMessage(context: context, title: 'Ошибка', content: state.error);
                  }
                  if (state is LoginSuccessState) {
                    AppRouter.toMainScreen(context);
                  }
                },
                builder: (context, state) {
                  final isLoading = state is LoginLoadingState;
                  final hasOpacity = (_login?.isEmpty ?? true) || (_password?.isEmpty ?? true);
                  return AppButton(
                    title: 'Войти',
                    isLoading: isLoading,
                    backgroundColor: AppColors.white.withOpacity(hasOpacity ? 0.1 : 0.95),
                    textColor: hasOpacity ? AppColors.white : AppColors.blueGradient4,
                    onPressed: () {
                      if (isLoading) return;
                      bloc.login(_login, _password);
                      FocusScope.of(context).unfocus();
                    },
                  );
                },
              ),
              const LoginFooter(),
            ],
          ),
        ),
      ),
    );
  }
}
