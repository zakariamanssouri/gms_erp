part of 'product_bloc.dart';

enum ProductRequestState {
  Loaded,
  Loading,
  Error,
  None,
  Searching,
  SearchLoaded,
  Updating,
  Updated,
  Adding,
  Added
}

class ProductState extends Equatable {
  List<Product> products = [];
  List<Product>? search_result;
  ProductRequestState requestState;
  String errorMessage;

  ProductState(
      {required this.products,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        products,
        requestState,
        errorMessage,
      ];
}
