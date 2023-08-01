part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetByCategory extends CategoryEvent {
  final String category;

  const GetByCategory(this.category);

  @override
  List<Object> get props => [category];
}
