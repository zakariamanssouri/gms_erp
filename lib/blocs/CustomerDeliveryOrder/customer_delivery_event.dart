import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/CustomerDeliveryOrder.dart';


abstract class CustomerDeliveryOrderEvent extends Equatable {
  const CustomerDeliveryOrderEvent();
  
  @override
  List<Object> get props => [];
}

class LoadAllCustomerDeliveryOrdersEvent extends CustomerDeliveryOrderEvent {
  const LoadAllCustomerDeliveryOrdersEvent();
}

class SearchCustomerDeliveryOrderEvent extends CustomerDeliveryOrderEvent {
  String search_value;
  List<CustomerDeliveryOrder> customer_delivery_ordres = [];

  SearchCustomerDeliveryOrderEvent({required this.search_value, required this.customer_delivery_ordres});

  @override
  List<Object> get props => [search_value, customer_delivery_ordres];
}
