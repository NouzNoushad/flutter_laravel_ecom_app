import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app_bloc/data/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/cart_add_request.dart';
import '../../models/cart_response.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;
  CartBloc({
    required this.cartRepository,
  }) : super(CartInitial()) {
    on<AddToCartEvent>(addToCart);
    on<GetCartProductsEvent>(getCartProducts);
    on<CartDeleteEvent>(deleteCart);
  }

  FutureOr<void> addToCart(
      AddToCartEvent event, Emitter<CartState> emit) async {
    try {
      var result = await cartRepository.addToCart(
          cartAddRequestModel: event.cartAddRequestModel);
      emit(CartAddedState(result));
    } catch (error) {
      emit(CartErrorState(error.toString()));
    }
  }

  FutureOr<void> getCartProducts(
      GetCartProductsEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      CartResponseModel cartProducts = await cartRepository.getCartProducts();
      emit(GetCartProductsState(cartProducts));
    } catch (error) {
      emit(CartErrorState(error.toString()));
    }
  }

  FutureOr<void> deleteCart(
      CartDeleteEvent event, Emitter<CartState> emit) async {
    emit(CartLoadingState());
    try {
      var result = await cartRepository.deleteCart(id: event.id);
      CartResponseModel cartProducts = await cartRepository.getCartProducts();
      emit(CartDeleteState(result));
      emit(GetCartProductsState(cartProducts));
    } catch (error) {
      emit(CartErrorState(error.toString()));
    }
  }
}
