part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationState {}

class AuthorizationInitial extends AuthorizationState {}

class LoginLoadingState extends AuthorizationState {}

class LoginErrorState extends AuthorizationState {
  final String error;
  LoginErrorState(this.error);
}

class LoginSuccessState extends AuthorizationState {}
