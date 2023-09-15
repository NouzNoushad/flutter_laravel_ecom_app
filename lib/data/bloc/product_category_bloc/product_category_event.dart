part of 'product_category_bloc.dart';

sealed class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();

  @override
  List<Object> get props => [];
}

class ProductCategoryLoadedEvent extends ProductCategoryEvent {
  final List<Result> products;
  final String category;
  const ProductCategoryLoadedEvent(this.products, this.category);

  @override
  List<Object> get props => [products, category];
}
