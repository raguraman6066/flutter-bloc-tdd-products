import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductApi {
  final Dio dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    final response = await dio.get('https://fakestoreapi.com/products');
    return (response.data as List)
        .map((e) => ProductModel.fromJson(e))
        .toList();
  }
}
