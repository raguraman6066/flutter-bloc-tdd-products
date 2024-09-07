import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../api/product_api.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductApi api;

  ProductRepositoryImpl(this.api);

  @override
  Future<List<Product>> fetchProducts() async {
    final products = await api.getProducts();
    return products.map((ProductModel productModel) {
      return Product(
        id: productModel.id,
        name: productModel.name,
        price: productModel.price,
        imageUrl: productModel.imageUrl,
      );
    }).toList();
  }
}
