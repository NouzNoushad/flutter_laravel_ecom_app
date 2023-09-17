part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCartEvent extends CartEvent {
  final CartAddRequestModel cartAddRequestModel;
  const AddToCartEvent(this.cartAddRequestModel);

  @override
  List<Object> get props => [cartAddRequestModel];
}

class GetCartProductsEvent extends CartEvent {
  const GetCartProductsEvent();

  @override
  List<Object> get props => [];
}

class CartDeleteEvent extends CartEvent {
  final int id;
  const CartDeleteEvent(this.id);

  @override
  List<Object> get props => [id];
}
