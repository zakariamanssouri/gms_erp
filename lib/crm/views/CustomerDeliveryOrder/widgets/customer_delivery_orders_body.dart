import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/CustomerDeliveryOrder/customer_delivery_bloc.dart';
import 'package:gms_erp/blocs/CustomerDeliveryOrder/customer_delivery_event.dart';
import 'package:gms_erp/blocs/purchased_orders/purchased_orders_bloc.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/widgets/SearchField.dart';

import '../../../../blocs/CustomerDeliveryOrder/customer_delivery_state.dart';
import 'customer_delivery_orders_body_list.dart';

class CustomerDeliveryOrdersPageBody extends StatelessWidget {
  const CustomerDeliveryOrdersPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Column(
        children: [
          Header(
            size: size / 1.5,
            child: SearchField(
                size: size / 1.4,
                onchanged_function: (String value) {
                  BlocProvider.of<CustomerDeliveryOrderBlock>(context).add(
                    SearchCustomerDeliveryOrderEvent(
                      search_value: value,
                      customer_delivery_ordres:
                          BlocProvider.of<CustomerDeliveryOrderBlock>(context).state.customer_delivery_ordres,
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: BlocBuilder<CustomerDeliveryOrderBlock, CustomerDeliveryOrderState>(
              builder: (context, state) {
                print("state.requestState: ${state.requestState}");
                // Initial state

                if (state.requestState == RequestState.Loading ||
                    state.requestState == RequestState.Searching) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.requestState == RequestState.Loaded ||
                    state.requestState == RequestState.SearchLoaded) {
                  return CustomerDeliveryOrdersList(
                      size: size,
                      orders: state.requestState == RequestState.Loaded
                          ? state.customer_delivery_ordres
                          : state.search_result!);
                }
                return ErrorWithRefreshButtonWidget(
                  inventory: null,
                  button_function: () {
                BlocProvider.of<CustomerDeliveryOrderBlock>(context).add(
                  const LoadAllCustomerDeliveryOrdersEvent(),
                );
                  },
                );
                // Initial state

                // Searching state

                // Searching state
              },
            ),
          )
        ],
      ),
    );
  }
}
