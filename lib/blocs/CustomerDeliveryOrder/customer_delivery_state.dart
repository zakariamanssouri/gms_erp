
import 'package:equatable/equatable.dart';

import '../../crm/models/CustomerDeliveryOrder.dart';

enum RequestState {
  Loaded,
  Loading,
  Error,
  None,
  Searching,
  SearchLoaded,
  Updating,
  Updated
}

class CustomerDeliveryOrderState extends Equatable {
  List<CustomerDeliveryOrder> customer_delivery_ordres = [];
  List<CustomerDeliveryOrder>? search_result;
  RequestState requestState;
  String errorMessage;

  CustomerDeliveryOrderState(
      {required this.customer_delivery_ordres,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        customer_delivery_ordres,
        requestState,
        errorMessage,
      ];
}
