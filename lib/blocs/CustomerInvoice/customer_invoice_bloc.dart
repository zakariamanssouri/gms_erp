import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/CustomerInvoice.dart';
import 'package:gms_erp/crm/services/CustomerInvoiceService.dart';
part 'customer_invoice_event.dart';
part 'customer_invoice_state.dart';

class CustomerInvoiceBloc extends Bloc<CustomerInvoiceEvent, CustomerInvoiceState> {
  CustomerInvoiceBloc() : super(CustomerInvoiceState(customer_invoices: [], requestState: RequestState.Loading, 
  errorMessage: '')) {
    on<LoadCustomerInvoices>((event, emit) async {
      emit(CustomerInvoiceState(customer_invoices:[], requestState: RequestState.Loading, errorMessage: ''));
      try {
        List<CustomerInvoice> customer_invoices = [];
        await CustomerInvoiceService
            .getCustomerInvoices()
            .then((value) => customer_invoices = value);
        emit(CustomerInvoiceState(customer_invoices: customer_invoices, requestState: RequestState.Loaded, errorMessage: ''));
      } catch (e) {
        print("error on block Client bloc : $e");
        emit(CustomerInvoiceState(customer_invoices:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });

    on<SearchCustomerInvoiceEvent>((event, emit) async {
      try {
        emit(CustomerInvoiceState(customer_invoices:
            event.customer_invoice_list, requestState: RequestState.Searching, errorMessage: '',
            search_result: []));

        List<CustomerInvoice> search_result = [];
        for (var i = 0; i < event.customer_invoice_list.length; i++) {
          if (event.customer_invoice_list[i].customerNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.customer_invoice_list[i].invoiceNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.customer_invoice_list[i].orderNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.customer_invoice_list[i].deliveryNo!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase())) {
            search_result.add(event.customer_invoice_list[i]);
          }
        }
        emit(CustomerInvoiceState(customer_invoices:
            event.customer_invoice_list, requestState: RequestState.SearchLoaded, errorMessage: '',
            search_result: search_result));
      } catch (e) {
        emit(CustomerInvoiceState(customer_invoices:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });
  }
}
