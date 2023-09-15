part of 'product_category_bloc.dart';

sealed class ProductCategoryState extends Equatable {
  const ProductCategoryState();
  
  @override
  List<Object> get props => [];
}

final class ProductCategoryInitial extends ProductCategoryState {}

final class ProductCategoryLoadedState extends ProductCategoryState {
  final List<Result> products;
  const ProductCategoryLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

final class ProductCategoryErrorState extends ProductCategoryState {
  final String error;
  const ProductCategoryErrorState(this.error);

  @override
  List<Object> get props => [error];
}
