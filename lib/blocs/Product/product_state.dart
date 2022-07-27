part of 'product_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object> get props => [];
}


enum ProductRequestState {
  Loading,
  Loaded,
  Error,
}
class ProductInitial extends ProductState {

  List<Product> products;
  ProductRequestState requestState;
  String errorMessage;
  ProductInitial({required this.products,required this.requestState,required this.errorMessage});

  @override
  List<Object> get props => [products,requestState,errorMessage];
}
