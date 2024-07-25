import 'package:equatable/equatable.dart';
import 'package:cubit_example/models/Products.dart';

class ShoppingCartState extends Equatable {
  final List<Product> cartItems;

  ShoppingCartState({this.cartItems = const []});

  @override
  List<Object> get props => [cartItems];
}

class ShoppingCartUpdated extends ShoppingCartState {
  ShoppingCartUpdated({List<Product> cartItems = const []})
      : super(cartItems: cartItems);
}
