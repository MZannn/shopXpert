part of 'navigation_bloc.dart';

abstract class NavigationState extends Equatable {
  const NavigationState();

  @override
  List<Object> get props => [];
}

class NavigationInitial extends NavigationState {}

class NavigationChangeScreenLoading extends NavigationState {}

class NavigationChangeScreenSuccess extends NavigationState {
  final int selectedIndex;

  const NavigationChangeScreenSuccess(this.selectedIndex);

  @override
  List<Object> get props => [selectedIndex];
}
