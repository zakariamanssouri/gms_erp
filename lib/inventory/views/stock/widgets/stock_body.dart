import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/blocs/stock/stock_bloc.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/inventory/views/stock/widgets/stock_list.dart';
import 'package:gms_erp/widgets/SearchField.dart';

class StockPageBody extends StatelessWidget {
  const StockPageBody({
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
                  BlocProvider.of<StockBlock>(context).add(
                    SearchStockEvent(
                      search_value: value,
                      product_list:
                          BlocProvider.of<StockBlock>(context).state.products,
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: BlocBuilder<StockBlock, StockState>(
              builder: (context, state) {
                print(state.products.length);
                // Initial state

                if (state.requestState == StockRequestState.Loading ||
                    state.requestState == StockRequestState.Searching) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.requestState == StockRequestState.Loaded ||
                    state.requestState == StockRequestState.SearchLoaded) {
                  return StockListView(
                      size: size,
                      products: state.requestState == StockRequestState.Loaded
                          ? state.products
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
