part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class GetDetailProduct extends DetailEvent {
  final String id;

  const GetDetailProduct(this.id);

  @override
  List<Object> get props => [id];
}
