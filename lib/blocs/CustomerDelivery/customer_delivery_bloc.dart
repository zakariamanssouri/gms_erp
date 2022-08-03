import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/CustomerDelivery.dart';
import 'package:gms_erp/crm/services/CustomerDeliveryService.dart';
part 'customer_delivery_event.dart';
part 'customer_delivery_state.dart';

class CustomerDeliveryBloc extends Bloc<CustomerDeliveryEvent, CustomerDeliveryState> {
  CustomerDeliveryBloc() : super(CustomerDeliveryState(customer_deliveries: [], requestState: RequestState.Loading, 
  errorMessage: '')) {
    on<LoadCustomerDeliveries>((event, emit) async {
      emit(CustomerDeliveryState(customer_deliveries:[], requestState: RequestState.Loading, errorMessage: ''));
      try {
        List<CustomerDelivery> customer_deliveries = [];
        await CustomerDeliveryService
            .getCustomerDeliveries()
            .then((value) => customer_deliveries = value);
        emit(CustomerDeliveryState(customer_deliveries: customer_deliveries, requestState: RequestState.Loaded, errorMessage: ''));
      } catch (e) {
        print("error on block Client bloc : $e");
        emit(CustomerDeliveryState(customer_deliveries:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });

    on<SearchCustomerDeliveryEvent>((event, emit) async {
      try {
        emit(CustomerDeliveryState(customer_deliveries:
            event.customer_delivery_list, requestState: RequestState.Searching, errorMessage: '',
            search_result: []));

        List<CustomerDelivery> search_result = [];
        for (var i = 0; i < event.customer_delivery_list.length; i++) {
          if (event.customer_delivery_list[i].customerNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.customer_delivery_list[i].deliveryNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase())) {
            search_result.add(event.customer_delivery_list[i]);
          }
        }
        emit(CustomerDeliveryState(customer_deliveries:
            event.customer_delivery_list, requestState: RequestState.SearchLoaded, errorMessage: '',
            search_result: search_result));
      } catch (e) {
        emit(CustomerDeliveryState(customer_deliveries:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });
  }
}
