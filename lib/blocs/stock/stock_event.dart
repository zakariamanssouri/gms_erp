part of 'stock_bloc.dart';

abstract class StockEvent extends Equatable {
  const StockEvent();
  
  @override
  List<Object> get props => [];
}

class LoadStockEvent extends StockEvent {
  const LoadStockEvent();
}

class SearchStockEvent extends StockEvent {
  String search_value;
  List<Stock> product_list = [];

  SearchStockEvent({required this.search_value, required this.product_list});

  @override
  List<Object> get props => [search_value, product_list];
}
