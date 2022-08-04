import 'package:flutter/material.dart';
import 'package:gms_erp/blocs/CustomerDelivery/customer_delivery_bloc.dart';
import 'package:gms_erp/crm/views/CustomerDelivery/customerDeliveryItem.dart';
import 'package:gms_erp/widgets/SearchField.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import '../../../widgets/ItemCardComplexe.dart';

class CustomerDeliveries extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CustomerDeliveryBloc()..add(LoadCustomerDeliveries()),
      child: CustomerDeliveriesHome(size: size),
    );
  }
}

class CustomerDeliveriesHome extends StatelessWidget {
  const CustomerDeliveriesHome({
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
        title: Text('Livraisons'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: CustomerDeliveriesBody(size: size),
    ));
  }
}

class CustomerDeliveriesBody extends StatelessWidget {
  CustomerDeliveriesBody({
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
                  BlocProvider.of<CustomerDeliveryBloc>(context).add(
                    SearchCustomerDeliveryEvent(value,
                        BlocProvider.of<CustomerDeliveryBloc>(context).state.customer_deliveries),
                  );
                }),
          ),
          Expanded(
            child:
                BlocBuilder<CustomerDeliveryBloc, CustomerDeliveryState>(builder: (context, state) {
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
                        ? state.customer_deliveries.length
                        : state.search_result?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCardComplexe(
                          size: size * 1.2,
                          onPressed: () {
                            print("lenghth here");
                            CustomerDeliveryBloc bloc =
                                BlocProvider.of<CustomerDeliveryBloc>(context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BlocProvider.value(
                                value: BlocProvider.of<CustomerDeliveryBloc>(_context),
                                child: CustomerDeliveryItem(
                                  customer_delivery:
                                      state.requestState == RequestState.Loaded
                                          ? state.customer_deliveries[index]
                                          : state.search_result![index],
                                ),
                              );
                            }));
                          },
                          var1: state.requestState == RequestState.Loaded
                              ? 'Ordre : ' + state.customer_deliveries[index].orderNo!
                              : 'Ordre : ' + state.search_result![index].orderNo!,
                          var2: state.requestState == RequestState.Loaded
                              ? 'Client : ' + state.customer_deliveries[index].customerNo!
                              : 'Client : ' + state.search_result![index].customerNo!,
                          var3: state.requestState == RequestState.Loaded
                              ? 'Total Net : ' + state.customer_deliveries[index].totalNetAmount! + ' | TVA : ' + state.customer_deliveries[index].totalVatAmount!
                              : 'Total Net : ' + state.search_result![index].totalNetAmount! + ' | TVA : ' + state.customer_deliveries[index].totalNetAmount!,
                          var7: state.requestState == RequestState.Loaded
                              ? state.customer_deliveries[index].invoiceDate ?? ''
                              : state.search_result![index].invoiceDate ?? '',
                          var6: state.requestState == RequestState.Loaded
                              ? 'Facture : ' + state.customer_deliveries[index].invoiceNo!
                              : 'Facture : ' + state.search_result![index].invoiceNo!,
                          indicator: state.customer_deliveries[index].paymentStateName == 'Ouvert'
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
                  BlocProvider.of<CustomerDeliveryBloc>(context).add(LoadCustomerDeliveries());
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
