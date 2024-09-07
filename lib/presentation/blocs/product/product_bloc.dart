import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/fetch_products_use_case.dart';
import 'product_event.dart';
import 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final FetchProductsUseCase fetchProductsUseCase;

  ProductBloc(this.fetchProductsUseCase) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await fetchProductsUseCase();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError('Failed to fetch products.'));
      }
    });
  }
}
