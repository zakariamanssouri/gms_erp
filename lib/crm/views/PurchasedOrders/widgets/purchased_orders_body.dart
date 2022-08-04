import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/purchased_orders/purchased_orders_bloc.dart';
import 'package:gms_erp/blocs/stock/stock_bloc.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:gms_erp/crm/views/PurchasedOrders/widgets/purchased_orders_body_list.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/inventory/views/stock/widgets/stock_list.dart';
import 'package:gms_erp/widgets/SearchField.dart';

class PurchasedOrdersPageBody extends StatelessWidget {
  const PurchasedOrdersPageBody({
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
                  BlocProvider.of<PurchasedOrderBlock>(context).add(
                    SeachOrderEvent(
                      search_value: value,
                      orders:
                          BlocProvider.of<PurchasedOrderBlock>(context).state.orders,
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: BlocBuilder<PurchasedOrderBlock, PurchasedOrdersState>(
              builder: (context, state) {
                print(state.orders.length);
                // Initial state

                if (state.requestState == PurchasedOrderRequestState.Loading ||
                    state.requestState == PurchasedOrderRequestState.Searching) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.requestState == PurchasedOrderRequestState.Loaded ||
                    state.requestState == PurchasedOrderRequestState.SearchLoaded) {
                  return PurchasedOrdersList(
                      size: size,
                      orders: state.requestState == PurchasedOrderRequestState.Loaded
                          ? state.orders
                          : state.search_result!);
                }
                return Container(
                    child: ErrorWithRefreshButtonWidget(
                  inventory: null,
                  button_function: () {
                    BlocProvider.of<StockBlock>(context).add(
                      const LoadStockEvent(),
                    );
                  },
                ));
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
