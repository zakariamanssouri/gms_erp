import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/CustomerOrder.dart';
import 'package:gms_erp/crm/services/CustomerOrderService.dart';
part 'customer_order_event.dart';
part 'customer_order_state.dart';

class CustomerOrderBloc extends Bloc<CustomerOrderEvent, CustomerOrderState> {
  CustomerOrderBloc() : super(CustomerOrderState(customer_orders: [], requestState: RequestState.Loading, 
  errorMessage: '')) {
    on<LoadCustomerOrders>((event, emit) async {
      emit(CustomerOrderState(customer_orders:[], requestState: RequestState.Loading, errorMessage: ''));
      try {
        List<CustomerOrder> customer_orders = [];
        await CustomerOrderService
            .getCustomerOrders()
            .then((value) => customer_orders = value);
        emit(CustomerOrderState(customer_orders: customer_orders, requestState: RequestState.Loaded, errorMessage: ''));
      } catch (e) {
        print("error on block Client bloc : $e");
        emit(CustomerOrderState(customer_orders:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });

    on<SearchCustomerOrderEvent>((event, emit) async {
      try {
        emit(CustomerOrderState(customer_orders:
            event.customer_order_list, requestState: RequestState.Searching, errorMessage: '',
            search_result: []));

        List<CustomerOrder> search_result = [];
        for (var i = 0; i < event.customer_order_list.length; i++) {
          if (event.customer_order_list[i].customerNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.customer_order_list[i].receiptNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase())) {
            search_result.add(event.customer_order_list[i]);
          }
        }
        emit(CustomerOrderState(customer_orders:
            event.customer_order_list, requestState: RequestState.SearchLoaded, errorMessage: '',
            search_result: search_result));
      } catch (e) {
        emit(CustomerOrderState(customer_orders:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });
  }
}
