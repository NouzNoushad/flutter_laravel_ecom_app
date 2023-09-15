import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app_bloc/data/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../models/products_response.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final ProductsRepository productsRepository;
  ProductCategoryBloc({
    required this.productsRepository,
  }) : super(ProductCategoryInitial()) {
    on<ProductCategoryLoadedEvent>(getProductCategories);
  }

  FutureOr<void> getProductCategories(
      ProductCategoryLoadedEvent event, Emitter<ProductCategoryState> emit) {
    try {
      List<Result> products =
          productsRepository.productCategories(event.products, event.category);
      for (var e in products) {
        print('////////// categorybloc: ${e.title}');
      }
      emit(ProductCategoryLoadedState(products));
    } catch (error) {
      emit(ProductCategoryErrorState(error.toString()));
    }
  }
}
