part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String message;

  const LoginSuccess(this.message);

  @override
  List<Object> get props => [message];
}

class LoginError extends LoginState {
  final String message;

  const LoginError(this.message);

  @override
  List<Object> get props => [message];
}
