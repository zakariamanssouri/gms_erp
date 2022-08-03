part of 'customer_order_bloc.dart';

enum RequestState { Loaded, Loading, Error, None, Searching, SearchLoaded }

class CustomerOrderState extends Equatable {
  List<CustomerOrder> customer_orders = [];
  List<CustomerOrder>? search_result;
  RequestState requestState;
  String errorMessage;

  CustomerOrderState(
      {required this.customer_orders,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        customer_orders,
        requestState,
        errorMessage,
      ];
}
