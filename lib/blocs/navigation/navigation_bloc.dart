import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationChangeScreen>((event, emit) {
      emit(NavigationChangeScreenLoading());
      emit(NavigationChangeScreenSuccess(event.selectedIndex));
    });
  }
}
