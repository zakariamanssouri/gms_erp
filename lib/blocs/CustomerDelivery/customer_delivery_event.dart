part of 'customer_delivery_bloc.dart';

abstract class CustomerDeliveryEvent extends Equatable {
  const CustomerDeliveryEvent();
  @override
  List<Object> get props => [];
}

class LoadCustomerDeliveries extends CustomerDeliveryEvent {
  List<CustomerDelivery> customer_delivery= [];
  @override
  List<Object> get props => [customer_delivery];
}


class SearchCustomerDeliveryEvent extends CustomerDeliveryEvent {
  String search_value;
  List<CustomerDelivery> customer_delivery_list = [];

  SearchCustomerDeliveryEvent(this.search_value, this.customer_delivery_list);

  @override
  List<Object> get props => [search_value, customer_delivery_list];
}
