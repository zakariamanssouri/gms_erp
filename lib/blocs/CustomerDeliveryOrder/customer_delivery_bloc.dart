import 'package:bloc/bloc.dart';
import 'package:gms_erp/crm/models/CustomerDeliveryOrder.dart';
import 'package:gms_erp/crm/services/CustomerDeliveryOrderService.dart';
import 'customer_delivery_event.dart';
import 'customer_delivery_state.dart';


class CustomerDeliveryOrderBlock extends Bloc<CustomerDeliveryOrderEvent, CustomerDeliveryOrderState> {
  CustomerDeliveryOrderBlock()
      : super(CustomerDeliveryOrderState(
            customer_delivery_ordres: [],
            requestState: RequestState.Loading,
            errorMessage: '')) {
    on<LoadAllCustomerDeliveryOrdersEvent>((event, emit) async {
      try {
        print("load customer delivery orders event");
        emit(CustomerDeliveryOrderState(
            customer_delivery_ordres: [],
            requestState: RequestState.Loading,
            errorMessage: ''));
        List<CustomerDeliveryOrder> customer_delivery_ordres = [];
        await CustomerDeliveryOrderService.getAllCustomerDeliveryOrders().then((list) => customer_delivery_ordres = list);
       
        emit(CustomerDeliveryOrderState(
            customer_delivery_ordres: customer_delivery_ordres,
            requestState: RequestState.Loaded,
            errorMessage: ''));

      } catch (e) {
        emit(CustomerDeliveryOrderState(
            customer_delivery_ordres: [],
            requestState: RequestState.Error,
            errorMessage: e.toString()));
      }
    });

    on<SearchCustomerDeliveryOrderEvent>((event, emit) async {
      try {
        emit(CustomerDeliveryOrderState(
            customer_delivery_ordres: event.customer_delivery_ordres,
            requestState: RequestState.Searching,
            errorMessage: '',
            search_result: []));

        List<CustomerDeliveryOrder> search_result = [];
        for (var i = 0; i < event.customer_delivery_ordres.length; i++) {
          if (event.customer_delivery_ordres[i].customerNo!
                  .startsWith(event.search_value.toLowerCase()) ||
              event.customer_delivery_ordres[i].orderNo!
                  .startsWith(event.search_value.toLowerCase()) ||event.customer_delivery_ordres[i].receiptNo!
                  .startsWith(event.search_value.toLowerCase()) ) {
            search_result.add(event.customer_delivery_ordres[i]);
          }
        }
        emit(CustomerDeliveryOrderState(
            customer_delivery_ordres: event.customer_delivery_ordres,
            search_result: search_result,
            requestState: RequestState.SearchLoaded,
            errorMessage: ''));
      } catch (e) {
        emit(CustomerDeliveryOrderState(
            customer_delivery_ordres: event.customer_delivery_ordres,
            search_result: [],
            requestState: RequestState.Error,
            errorMessage: ''));
      }
    });

  
  }
}
