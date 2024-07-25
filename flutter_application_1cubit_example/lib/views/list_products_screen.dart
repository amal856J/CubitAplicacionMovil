import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_example/models/Products.dart';
import 'package:cubit_example/models/repository/repository_data.dart';
import 'package:cubit_example/views/dails_screen.dart';
import 'package:cubit_example/cubits/shopping_cart_cubit.dart';
import 'package:cubit_example/cubits/shopping_cart_state.dart';

import 'package:cubit_example/views/shopping_cart_screen.dart';

class ListProductsScreen extends StatelessWidget {
  const ListProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RepositoryData repositoryData = RepositoryData();
    final List<Product> products = repositoryData.getProducts();

    return Scaffold(
      appBar: AppBar(title: const Text('Listado de Productos')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange),
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: ListTile(
                      title: Text(product.name),
                      subtitle: Text(product.description ?? 'Sin descripción'),
                      trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(product: product),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
          BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
            builder: (context, state) {
              if (state.cartItems.isNotEmpty) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCartScreen(),
                        ),
                      );
                    },
                    child: const Text('Ver Carrito'),
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
