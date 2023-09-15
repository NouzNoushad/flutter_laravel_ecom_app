import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app_bloc/data/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/products_response.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository productsRepository;
  ProductsBloc({
    required this.productsRepository,
  }) : super(ProductsInitial()) {
    on<ProductsLoadedEvent>(getProducts);
  }

  FutureOr<void> getProducts(
      ProductsEvent event, Emitter<ProductsState> emit) async {
    emit(ProductsLoadingState());
    try {
      List<Result> products = await productsRepository.getProducts();
      emit(ProductsLoadedState(products));
    } catch (error) {
      emit(ProductsErrorState(error.toString()));
    }
  }
    
}
