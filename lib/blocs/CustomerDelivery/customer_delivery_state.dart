part of 'customer_delivery_bloc.dart';

enum RequestState { Loaded, Loading, Error, None, Searching, SearchLoaded }

class CustomerDeliveryState extends Equatable {
  List<CustomerDelivery> customer_deliveries = [];
  List<CustomerDelivery>? search_result;
  RequestState requestState;
  String errorMessage;

  CustomerDeliveryState(
      {required this.customer_deliveries,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        customer_deliveries,
        requestState,
        errorMessage,
      ];
}
