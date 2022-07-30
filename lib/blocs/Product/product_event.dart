part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
  
  @override
  List<Object> get props => [];
}

class LoadAllProductsEvent extends ProductEvent {
  const LoadAllProductsEvent();
}

class SearchProductEvent extends ProductEvent {
  String search_value;
  List<Product> product_list = [];

  SearchProductEvent({required this.search_value, required this.product_list});

  @override
  List<Object> get props => [search_value, product_list];
}

class UpdateProductEvent extends ProductEvent {
  Product product;

  UpdateProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}

class AddProductEvent extends ProductEvent {
  Product product;
  
  AddProductEvent({required this.product});

  @override
  List<Object> get props => [product];
}