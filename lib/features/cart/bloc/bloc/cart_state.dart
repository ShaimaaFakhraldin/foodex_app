part of 'cart_bloc.dart';

abstract class CartState {
  final List<RestaurentDatum> cartItem;
  const CartState({required this.cartItem});

  @override
  List<Object> get props => [];
}

class CartLoadInProgress extends CartState {
  CartLoadInProgress({required super.cartItem});
}

class ProductAdded extends CartState {
  final List<RestaurentDatum> cartItem;

  const ProductAdded({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductAdded { todos: $cartItem }';
}

class ProductRemoved extends CartState {
  final List<RestaurentDatum> cartItem;

  const ProductRemoved({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}
class ClearCartList extends CartState {
  final List<RestaurentDatum> cartItem;

  const ClearCartList({required this.cartItem}) : super(cartItem: cartItem);

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'ProductRemoved { todos: $cartItem }';
}
