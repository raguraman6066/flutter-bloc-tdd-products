import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product/product_bloc.dart';
import '../blocs/product/product_state.dart';
import '../blocs/product/product_event.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCard(product: product);
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No products available.'));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductBloc>().add(LoadProducts());
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
