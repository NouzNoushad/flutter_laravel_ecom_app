import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecom_app_bloc/data/repositories/products_repository.dart';
import 'package:equatable/equatable.dart';

import '../../models/products_response.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final ProductsRepository productsRepository;
  CategoryBloc({
    required this.productsRepository,
  }) : super(CategoryInitial()) {
    on<CategoryLoadedEvent>(getCategories);
  }

  FutureOr<void> getCategories(
      CategoryLoadedEvent event, Emitter<CategoryState> emit) {
    List<String> categories = productsRepository.getCategories(event.products);
    emit(CategoryLoadedState(categories));
  }
}
