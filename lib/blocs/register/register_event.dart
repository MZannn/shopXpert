part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEventSubmit extends RegisterEvent {
  final String email;
  final String username;
  final String password;
  final String firstName;
  final String lastName;

  const RegisterEventSubmit(
      {required this.email,
      required this.password,
      required this.username,
      required this.firstName,
      required this.lastName});

  @override
  List<Object> get props => [email, username, password, firstName, lastName];
}
