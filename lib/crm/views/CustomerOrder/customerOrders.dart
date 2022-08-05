import 'package:flutter/material.dart';
import 'package:gms_erp/blocs/CustomerOrder/customer_order_bloc.dart';
import 'package:gms_erp/crm/views/CustomerOrder/addCustomerOrder.dart';
import 'package:gms_erp/crm/views/CustomerOrder/customerOrderItem.dart';
import 'package:gms_erp/widgets/SearchField.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import '../../../widgets/ItemCard.dart';

class CustomerOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => CustomerOrderBloc()..add(LoadCustomerOrders()),
      child: CustomerOrdersHome(size: size),
    );
  }
}

class CustomerOrdersHome extends StatelessWidget {
  const CustomerOrdersHome({
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
        title: Text('Commandes'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: CustomerOrdersBody(size: size),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //             Navigator.push(_context,
      //                 MaterialPageRoute(builder: (context) {
      //               return BlocProvider.value(
      //                 value: BlocProvider.of<CustomerOrderBloc>(
      //                     _context),
      //     child: AddCustomerOrderPage());}));
      //   },
      //   backgroundColor: Colors.white,
      //   child: const Icon(
      //     Icons.add,
      //     color: Colors.blue,
      //   ),
      // ),
    ));
  }
}

class CustomerOrdersBody extends StatelessWidget {
  CustomerOrdersBody({
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
                  BlocProvider.of<CustomerOrderBloc>(context).add(
                    SearchCustomerOrderEvent(value,
                        BlocProvider.of<CustomerOrderBloc>(context).state.customer_orders),
                  );
                }),
          ),
          Expanded(
            child:
                BlocBuilder<CustomerOrderBloc, CustomerOrderState>(builder: (context, state) {
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
                        ? state.customer_orders.length
                        : state.search_result?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                          size: size,
                          onPressed: () {
                            print("lenghth here");
                            CustomerOrderBloc bloc =
                                BlocProvider.of<CustomerOrderBloc>(context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BlocProvider.value(
                                value: BlocProvider.of<CustomerOrderBloc>(_context),
                                child: CustomerOrderItem(
                                  customer_order:
                                      state.requestState == RequestState.Loaded
                                          ? state.customer_orders[index]
                                          : state.search_result![index],
                                ),
                              );
                            }));
                          },
                          var1: state.requestState == RequestState.Loaded
                              ? 'Reçu : ' + state.customer_orders[index].receiptNo!
                              : 'Reçu : ' + state.search_result![index].receiptNo!,
                          var2: state.requestState == RequestState.Loaded
                              ? 'Client : ' + state.customer_orders[index].customerNo!
                              : 'Client : ' + state.search_result![index].customerNo!,
                          var3: state.requestState == RequestState.Loaded
                              ? 'Total Net : ' + state.customer_orders[index].totalNetAmount! + ' | TVA : ' + state.customer_orders[index].totalVatAmount!
                              : 'Total Net : ' + state.search_result![index].totalNetAmount! + ' | TVA : ' + state.customer_orders[index].totalNetAmount!,
                          var4: state.requestState == RequestState.Loaded
                              ? state.customer_orders[index].deliveryDate!.split(' ')[0]
                              : state.search_result![index].deliveryDate!.split(' ')[0]);
                    },
                  ),
                );
              }
              // data is loaded

              // Error
              return ErrorWithRefreshButtonWidget(
                inventory: null,
                button_function: () {
                  BlocProvider.of<CustomerOrderBloc>(context).add(LoadCustomerOrders());
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
