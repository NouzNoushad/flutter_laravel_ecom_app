part of 'cart_bloc.dart';

sealed class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

final class CartInitial extends CartState {}

final class CartLoadingState extends CartState {}

class CartAddedState extends CartState {
  final String result;
  const CartAddedState(this.result);

  @override
  List<Object> get props => [result];
}

class GetCartProductsState extends CartState {
  final CartResponseModel cartProducts;
  const GetCartProductsState(this.cartProducts);

  @override
  List<Object> get props => [cartProducts];
}

class CartDeleteState extends CartState {
  final String result;
  const CartDeleteState(this.result);

  @override
  List<Object> get props => [result];
}

class CartErrorState extends CartState {
  final String error;
  const CartErrorState(this.error);

  @override
  List<Object> get props => [error];
}
