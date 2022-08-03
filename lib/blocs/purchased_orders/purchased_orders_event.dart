part of 'purchased_orders_bloc.dart';

abstract class PurchasedOrdersEvent extends Equatable {
  const PurchasedOrdersEvent();
  
  @override
  List<Object> get props => [];
}

class LoadAllOrders extends PurchasedOrdersEvent {
  const LoadAllOrders();
}

class SeachOrderEvent extends PurchasedOrdersEvent {
  String search_value;
  List<PurchaseOrder> orders = [];

  SeachOrderEvent({required this.search_value, required this.orders});

  @override
  List<Object> get props => [search_value, orders];
}
