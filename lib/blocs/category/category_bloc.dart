import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shopxpert/models/product_model.dart';
import 'package:shopxpert/services/base_api.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final API api = API();
  CategoryBloc() : super(CategoryInitial()) {
    on<GetByCategory>((event, emit) async {
      try {
        emit(CategoryLoading());
        var response = await api.dio.get('products/category/${event.category}');
        if (response.statusCode == 200) {
          List<ProductModel> products = [];
          response.data.forEach((product) {
            products.add(ProductModel.fromJson(product));
          });
          emit(CategoryLoaded(products));
        }
      } catch (e) {
        emit(CategoryError(e.toString()));
      }
    });
  }
}
