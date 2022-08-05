part of 'customer_invoice_bloc.dart';

abstract class CustomerInvoiceEvent extends Equatable {
  const CustomerInvoiceEvent();
  @override
  List<Object> get props => [];
}

class LoadCustomerInvoices extends CustomerInvoiceEvent {
  List<CustomerInvoice> customer_invoice = [];
  @override
  List<Object> get props => [customer_invoice];
}


class SearchCustomerInvoiceEvent extends CustomerInvoiceEvent {
  String search_value;
  List<CustomerInvoice> customer_invoice_list = [];

  SearchCustomerInvoiceEvent(this.search_value, this.customer_invoice_list);

  @override
  List<Object> get props => [search_value, customer_invoice_list];
}
