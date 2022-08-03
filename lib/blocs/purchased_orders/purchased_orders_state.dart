part of 'purchased_orders_bloc.dart';

enum PurchasedOrderRequestState {
  Loaded,
  Loading,
  Error,
  None,
  Searching,
  SearchLoaded,
  Updating,
  Updated
}

class PurchasedOrdersState extends Equatable {
  List<PurchaseOrder> orders = [];
  List<PurchaseOrder>? search_result;
  PurchasedOrderRequestState requestState;
  String errorMessage;

  PurchasedOrdersState(
      {required this.orders,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        orders,
        requestState,
        errorMessage,
      ];
}
