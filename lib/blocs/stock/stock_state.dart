part of 'stock_bloc.dart';

enum StockRequestState {
  Loaded,
  Loading,
  Error,
  None,
  Searching,
  SearchLoaded,
  Updating,
  Updated
}

class StockState extends Equatable {
  List<Stock> products = [];
  List<Stock>? search_result;
  StockRequestState requestState;
  String errorMessage;

  StockState(
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
