part of 'customer_order_bloc.dart';

abstract class CustomerOrderEvent extends Equatable {
  const CustomerOrderEvent();
  @override
  List<Object> get props => [];
}

class LoadCustomerOrders extends CustomerOrderEvent {
  List<CustomerOrder> customer_order = [];
  @override
  List<Object> get props => [customer_order];
}


class SearchCustomerOrderEvent extends CustomerOrderEvent {
  String search_value;
  List<CustomerOrder> customer_order_list = [];

  SearchCustomerOrderEvent(this.search_value, this.customer_order_list);

  @override
  List<Object> get props => [search_value, customer_order_list];
}


class UpdateCustomerOrderEvent extends CustomerOrderEvent {
  CustomerOrder customer_order;

  UpdateCustomerOrderEvent({required this.customer_order});
  @override
  List<Object> get props => [CustomerOrder];
}


class AddCustomerOrderEvent extends CustomerOrderEvent {
  CustomerOrder customer_order;
  
  AddCustomerOrderEvent({required this.customer_order});

  @override
  List<Object> get props => [customer_order];
}
