part of 'products_bloc.dart';

sealed class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

final class ProductsInitial extends ProductsState {}

final class ProductsLoadingState extends ProductsState {}

final class ProductsLoadedState extends ProductsState {
  final List<Result> products;
  const ProductsLoadedState(this.products);

  @override
  List<Object> get props => [products];
}

final class ProductsErrorState extends ProductsState {
  final String error;
  const ProductsErrorState(this.error);

  @override
  List<Object> get props => [error];
}
