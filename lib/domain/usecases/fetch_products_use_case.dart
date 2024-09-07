import '../entities/product.dart';
import '../repositories/product_repository.dart';

class FetchProductsUseCase {
  final ProductRepository repository;

  FetchProductsUseCase(this.repository);

  Future<List<Product>> call() async {
    return await repository.fetchProducts();
  }
}
