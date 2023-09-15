part of 'category_bloc.dart';

sealed class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class CategoryLoadedEvent extends CategoryEvent {
  final List<Result> products;

  const CategoryLoadedEvent(this.products);

  @override
  List<Object> get props => [products];
}
