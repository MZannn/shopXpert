import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopxpert/models/product_model.dart';
import 'package:shopxpert/services/base_api.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final API api = API();
  HomeBloc() : super(HomeInitial()) {
    on<GetAllProducts>((event, emit) async {
      try {
        var response = await api.dio.get('products');
        if (response.statusCode == 200) {
          List<ProductModel> products = [];
          List<String> categories = [];
          response.data.forEach((product) {
            products.add(ProductModel.fromJson(product));
            if (!categories.contains(product['category'])) {
              categories.add(product['category']);
            }
          });
          emit(
            HomeLoaded(
              products,
              categories,
            ),
          );
        }
      } catch (e) {
        emit(
          HomeError(e.toString()),
        );
      }
    });
  }
}
