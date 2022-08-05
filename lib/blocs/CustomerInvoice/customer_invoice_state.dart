part of 'customer_invoice_bloc.dart';

enum RequestState { Loaded, Loading, Error, None, Searching, SearchLoaded }

class CustomerInvoiceState extends Equatable {
  List<CustomerInvoice> customer_invoices = [];
  List<CustomerInvoice>? search_result;
  RequestState requestState;
  String errorMessage;

  CustomerInvoiceState(
      {required this.customer_invoices,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        customer_invoices,
        requestState,
        errorMessage,
      ];
}
