import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/api/product_api.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/usecases/fetch_products_use_case.dart';
import 'presentation/blocs/product/product_bloc.dart';
import 'presentation/screens/product_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter eCommerce',
      home: BlocProvider(
        create: (context) => ProductBloc(
          FetchProductsUseCase(
            ProductRepositoryImpl(ProductApi()),
          ),
        ),
        child: ProductListScreen(),
      ),
    );
  }
}
