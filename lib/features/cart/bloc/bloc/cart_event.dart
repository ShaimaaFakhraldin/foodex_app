part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

abstract class CartQuantity extends CartEvent {
  final int cartQuantity ;
  const CartQuantity({required this.cartQuantity});

  @override
  List<Object> get props => [cartQuantity];
}
class AddProductToCart extends CartEvent {
  final RestaurentDatum cartItem;

  const AddProductToCart({ required this.cartItem}) ;

  @override
  List<Object> get props => [cartItem];

  @override
  String toString() => 'AddProduct { index: $cartItem }';
}
class RemoveProduct extends CartEvent {
  final int productIndex;

  const RemoveProduct(this.productIndex);

  @override
  List<Object> get props => [productIndex];

  @override
  String toString() => 'RemoveProduct { index: $productIndex }';
}
class ClearCart extends CartEvent {

  const ClearCart( );

  @override
  List<Object> get props => [];


}