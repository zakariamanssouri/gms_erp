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
  final String searchvalue;
  const SearchProductEvent(this.searchvalue);
}
