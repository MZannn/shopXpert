part of 'navigation_bloc.dart';

abstract class NavigationEvent extends Equatable {
  const NavigationEvent();

  @override
  List<Object> get props => [];
}

class NavigationChangeScreen extends NavigationEvent {
  final int selectedIndex;

  const NavigationChangeScreen({required this.selectedIndex});

  @override
  List<Object> get props => [selectedIndex];
}
