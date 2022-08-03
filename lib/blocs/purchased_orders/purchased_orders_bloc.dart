import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/crm/models/PurchaseOrder.dart';
import 'package:gms_erp/crm/services/purchased_orders.service.dart';
import 'package:gms_erp/inventory/models/stock.dart';
import 'package:gms_erp/inventory/services/stock.service.dart';
part 'purchased_orders_event.dart';
part 'purchased_orders_state.dart';

class PurchasedOrderBlock
    extends Bloc<PurchasedOrdersEvent, PurchasedOrdersState> {
  PurchasedOrderBlock()
      : super(PurchasedOrdersState(
            orders: [],
            requestState: PurchasedOrderRequestState.Loading,
            errorMessage: '')) {
    on<LoadAllOrders>((event, emit) async {
      try {
        print("load stock event");
        emit(PurchasedOrdersState(
            orders: [],
            requestState: PurchasedOrderRequestState.Loading,
            errorMessage: ''));
        List<PurchaseOrder> orders = [];
        await PurchasedOrdersService.getAllPurchasedOrders()
            .then((value) => orders = value);
        print(orders.length);
        emit(PurchasedOrdersState(
            orders: orders,
            requestState: PurchasedOrderRequestState.Loaded,
            errorMessage: ''));
      } catch (e) {
        print(e);
        emit(PurchasedOrdersState(
            orders: [],
            requestState: PurchasedOrderRequestState.Error,
            errorMessage: e.toString()));
      }
    });

    on<SeachOrderEvent>((event, emit) async {
      try {
        print('------------------------------------');
        print("start search product event on product bloc");
        print("search value: ${event.search_value}");
        emit(PurchasedOrdersState(
            orders: event.orders,
            requestState: PurchasedOrderRequestState.Searching,
            errorMessage: '',
            search_result: []));

        List<PurchaseOrder> search_result = [];
        var lower_search_value = event.search_value.toLowerCase();
        for (var i = 0; i < event.orders.length; i++) {
          if (event.orders[i].vendorName1
                  .toLowerCase()
                  .startsWith(lower_search_value) ||
              event.orders[i].receiptNo
                  .startsWith(lower_search_value) ||
              event.orders[i].vendorNo
                  .toLowerCase()
                  .startsWith(lower_search_value)) {
            search_result.add(event.orders[i]);
          }
        }
        print("search result: ${search_result.length}");
        emit(PurchasedOrdersState(
            orders: event.orders,
            search_result: search_result,
            requestState: PurchasedOrderRequestState.SearchLoaded,
            errorMessage: ''));
      } catch (e) {
        print("error on purchased orders bloc ${e.toString()}");
        emit(PurchasedOrdersState(
            orders: event.orders,
            search_result: [],
            requestState: PurchasedOrderRequestState.Error,
            errorMessage: ''));
      }
    });
  }
}
