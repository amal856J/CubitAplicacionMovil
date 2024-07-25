import 'package:flutter/material.dart';
import 'package:cubit_example/models/Products.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cubit_example/cubits/shopping_cart_cubit.dart';

class DetailsScreen extends StatefulWidget {
  final Product product;

  const DetailsScreen({super.key, required this.product});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detalles del Producto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombre: ${widget.product.name}',
                style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text(
                'Descripción: ${widget.product.description ?? 'Sin descripción'}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Precio: \$${widget.product.price.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Descuento: ${widget.product.discount}%',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('Stock: ${widget.product.stock}',
                style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(Icons.remove),
                  onPressed: decrementQuantity,
                ),
                Text('$quantity', style: TextStyle(fontSize: 20)),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: incrementQuantity,
                ),
              ],
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final product = widget.product.copyWith(quantity: quantity);
                  context.read<ShoppingCartCubit>().addItem(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Producto añadido al carrito')),
                  );
                },
                child: Text('Agregar al carrito'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
