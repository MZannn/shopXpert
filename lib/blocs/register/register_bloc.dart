import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopxpert/services/base_api.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final API api = API();
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEventSubmit>((event, emit) async {
      emit(RegisterLoading());
      try {
        var response = await api.dio.post('users', data: {
          'email': event.email,
          'username': event.username,
          'password': event.password,
          'name': {
            'firstname': event.firstName,
            'lastname': event.lastName,
          }
        });
        if (response.statusCode == 200 || response.statusCode == 201) {
          emit(const RegisterSuccess('Register Success'));
        }
      } catch (e) {
        emit(RegisterError(e.toString()));
      }
    });
  }
}
