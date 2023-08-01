import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopxpert/models/product_model.dart';
import 'package:shopxpert/services/base_api.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final API api = API();
  DetailBloc() : super(DetailInitial()) {
    on<GetDetailProduct>((event, emit) async {
      try {
        emit(DetailLoading());
        var response = await api.dio.get('products/${event.id}');
        ProductModel product = ProductModel.fromJson(response.data);
        emit(
          DetailLoaded(product),
        );
      } catch (e) {
        emit(
          DetailError(e.toString()),
        );
      }
    });
  }
}
