import 'package:flutter/material.dart';
import 'package:gms_erp/blocs/CustomerInvoice/customer_invoice_bloc.dart';
import 'package:gms_erp/crm/views/CustomerInvoice/customerInvoiceItem.dart';
import 'package:gms_erp/widgets/SearchField.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import '../../../widgets/ItemCardComplexe.dart';

class CustomerInvoices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CustomerInvoiceBloc()..add(LoadCustomerInvoices()),
      child: CustomerInvoicesHome(size: size),
    );
  }
}

class CustomerInvoicesHome extends StatelessWidget {
  const CustomerInvoicesHome({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return SafeArea(
        child: Scaffold(
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: Text('Factures'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: CustomerInvoicesBody(size: size),
    ));
  }
}

class CustomerInvoicesBody extends StatelessWidget {
  CustomerInvoicesBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Header(
            size: size / 1.5,
            child: SearchField(
                size: size / 1.4,
                onchanged_function: (String value) {
                  BlocProvider.of<CustomerInvoiceBloc>(context).add(
                    SearchCustomerInvoiceEvent(value,
                        BlocProvider.of<CustomerInvoiceBloc>(context).state.customer_invoices),
                  );
                }),
          ),
          Expanded(
            child:
                BlocBuilder<CustomerInvoiceBloc, CustomerInvoiceState>(builder: (context, state) {
              print("request state:${state.requestState}");
              // data is loading
              if (state.requestState == RequestState.Loading ||
                  state.requestState == RequestState.Searching)
                return Container(
                  height: size.height * 0.5,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              // data is loading
              // data is loaded
              else if (state.requestState == RequestState.Loaded ||
                  state.requestState == RequestState.SearchLoaded) {
                return Container(
                  height: size.height * 0.78,
                  padding: EdgeInsets.only(
                      top: GlobalParams.MainPadding / 2,
                      left: GlobalParams.MainPadding / 3,
                      right: GlobalParams.MainPadding / 4),
                  child: ListView.builder(
                    itemCount: state.requestState == RequestState.Loaded
                        ? state.customer_invoices.length
                        : state.search_result?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCardComplexe(
                          size: size * 1.2,
                          onPressed: () {
                            print("lenghth here");
                            CustomerInvoiceBloc bloc =
                                BlocProvider.of<CustomerInvoiceBloc>(context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BlocProvider.value(
                                value: BlocProvider.of<CustomerInvoiceBloc>(_context),
                                child: CustomerInvoiceItem(
                                  customer_invoice:
                                      state.requestState == RequestState.Loaded
                                          ? state.customer_invoices[index]
                                          : state.search_result![index],
                                ),
                              );
                            }));
                          },
                          var6: state.requestState == RequestState.Loaded
                              ? 'Ordre : ' + state.customer_invoices[index].orderNo! + ' | Livraison : ' + state.customer_invoices[index].deliveryNo!
                              : 'Ordre : ' + state.search_result![index].orderNo! + ' | Livraison : ' + state.customer_invoices[index].deliveryNo!,
                          var2: state.requestState == RequestState.Loaded
                              ? 'Client : ' + state.customer_invoices[index].customerNo!
                              : 'Client : ' + state.search_result![index].customerNo!,
                          var3: state.requestState == RequestState.Loaded
                              ? 'Total Net : ' + state.customer_invoices[index].totalNetAmount! + ' | TVA : ' + state.customer_invoices[index].totalVatAmount!
                              : 'Total Net : ' + state.search_result![index].totalNetAmount! + ' | TVA : ' + state.customer_invoices[index].totalNetAmount!,
                          var7: state.requestState == RequestState.Loaded
                              ? (state.customer_invoices[index].invoiceDate!.split(' ')[0])
                              : (state.search_result![index].invoiceDate!.split(' ')[0]),
                          var1: state.requestState == RequestState.Loaded
                              ? 'Facture : ' + (state.customer_invoices[index].invoiceNo ?? '')
                              : 'Facture : ' + (state.search_result![index].invoiceNo ?? ''),
                          indicator: state.customer_invoices[index].paymentStateName == 'Ouvert'
                              ? const Icon(
                                  Icons.radio_button_unchecked,
                                  size: 15,
                                  color: Colors.white,
                                )
                              : const Icon(
                                  Icons.verified,
                                  size: 15,
                                  color: Colors.white,
                                ),);
                    },
                  ),
                );
              }
              // data is loaded

              // Error
              return ErrorWithRefreshButtonWidget(
                inventory: null,
                button_function: () {
                  BlocProvider.of<CustomerInvoiceBloc>(context).add(LoadCustomerInvoices());
                },
              );
              // Error
            }),
          )
        ],
      ),
    );
  }
}
