part of 'authorization_bloc.dart';

@immutable
abstract class AuthorizationEvent {}

class LoginEvent extends AuthorizationEvent {
  final String? login;
  final String? password;

  LoginEvent({this.login, this.password});
}
