import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_example/cubits/shopping_cart_cubit.dart';
import 'package:cubit_example/cubits/shopping_cart_state.dart';

class ShoppingCartScreen extends StatelessWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Carrito de Compras')),
      body: BlocBuilder<ShoppingCartCubit, ShoppingCartState>(
        builder: (context, state) {
          if (state is ShoppingCartUpdated && state.cartItems.isEmpty) {
            return Center(child: Text('El carrito está vacío.'));
          }

          if (state is ShoppingCartUpdated) {
            return ListView.builder(
              itemCount: state.cartItems.length,
              itemBuilder: (context, index) {
                final product = state.cartItems[index];
                return ListTile(
                  title: Text(product.name),
                  subtitle: Text(product.description ?? 'Sin descripción'),
                  trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
