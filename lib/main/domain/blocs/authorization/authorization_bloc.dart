import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:yoko_test/main/data/providers/authorization/authorization_provider.dart';

part 'authorization_event.dart';
part 'authorization_state.dart';

class AuthorizationBloc extends Bloc<AuthorizationEvent, AuthorizationState> {
  void login(String? login, String? password) => add(LoginEvent(login: login, password: password));

  AuthorizationBloc() : super(AuthorizationInitial()) {
    on<LoginEvent>(_login);
  }

  final _provider = AuthorizationProvider();

  void _login(LoginEvent event, Emitter<AuthorizationState> emit) async {
    final error = isValid(event);
    if (error != null) {
      return emit(LoginErrorState(error));
    }

    emit(LoginLoadingState());
    try {
      final response = await _provider.login(event.login!, event.password!);
      if (response.isSuccess) {
        return emit(LoginSuccessState());
      }
      emit(LoginErrorState(response.error ?? 'Что-то пошло не так'));
    } catch (e) {
      debugPrint('Auth bloc login error: $e');
      emit(LoginErrorState('Что-то пошло не так'));
    }
  }

  String? isValid(LoginEvent event) {
    if (event.login?.isEmpty ?? true) {
      return 'Заполните E-mail';
    }
    if (!(event.login!.contains('@'))) {
      return 'Некорректный E-mail';
    }
    if (event.password?.isEmpty ?? true) {
      return 'Заполните пароль';
    }
    return null;
  }
}
