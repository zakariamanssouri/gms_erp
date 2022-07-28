
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/widgets/SearchField.dart';

import 'ProductListView.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("builded");
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
                  BlocProvider.of<ProductBloc>(context).add(
                    SearchProductEvent(
                      search_value: value,
                      product_list:
                          BlocProvider.of<ProductBloc>(context).state.products,
                    ),
                  );
                }),
          ),
          SizedBox(
            height: 4,
          ),
          Expanded(
            child: BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                // Initial state
                print("request state: ${state.requestState}");
                if (state.requestState == ProductRequestState.Loading ||
                    state.requestState == ProductRequestState.Searching) {
                  return Center(child: CircularProgressIndicator());
                } else if (state.requestState == ProductRequestState.Loaded ||
                    state.requestState == ProductRequestState.SearchLoaded) {
                  return ProductsListView(
                      size: size,
                      products: state.requestState == ProductRequestState.Loaded
                          ? state.products
                          : state.search_result!);
                }
                return Container(
                    child: ErrorWithRefreshButtonWidget(
                  inventory: null,
                  button_function: () {},
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
