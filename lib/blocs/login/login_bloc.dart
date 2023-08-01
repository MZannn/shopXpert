import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopxpert/services/base_api.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final API api = API();
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      try {
        var response = await api.dio.post('auth/login', data: {
          'username': event.username,
          'password': event.password,
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(const LoginSuccess('Login Success'));
        }
      } catch (e) {
        emit(
          LoginError(
            e.toString(),
          ),
        );
      }
    });
  }
}
