import 'package:bloc/bloc.dart';
import 'package:cubit_example/models/Products.dart';
import 'package:cubit_example/cubits/shopping_cart_state.dart';

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  ShoppingCartCubit() : super(ShoppingCartState());

  void addItem(Product product) {
    final updatedCart = List<Product>.from(state.cartItems)..add(product);
    emit(ShoppingCartUpdated(cartItems: updatedCart));
  }

  void removeItem(Product product) {
    final updatedCart = List<Product>.from(state.cartItems)..remove(product);
    emit(ShoppingCartUpdated(cartItems: updatedCart));
  }
}
