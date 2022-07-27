import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/views/Products/Details/product_details.dart';
import 'package:gms_erp/widgets/ItemCard.dart';
import 'package:gms_erp/widgets/SearchField.dart';

import '../InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import '../InventoryDetails/widgets/Header.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("widget built");
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadAllProductsEvent()),
      child: Scaffold(
        backgroundColor: GlobalParams.backgroundColor,
        appBar: AppBar(
          title: const Text('Products'),
          elevation: 0,
          backgroundColor: Colors.blue,
        ),
        body: Container(
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
                          value,
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
                    if (state is ProductInitial) {
                      if (state.requestState == ProductRequestState.Loading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state.requestState ==
                          ProductRequestState.Loaded) {
                        return Container(
                            height: size.height * 0.78,
                            padding: EdgeInsets.only(
                                top: GlobalParams.MainPadding / 2,
                                left: GlobalParams.MainPadding / 3,
                                right: GlobalParams.MainPadding / 4),
                            child: ListView.builder(
                                itemCount: state.products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return BlocProvider(
                                      create: (context) =>
                                          BlocProvider.of<ProductBloc>(context),
                                      child: ItemCard(
                                        onPressed: () {
                                          Navigator.push(context,
                                              MaterialPageRoute(
                                                  builder: (context) {
                                            return ProductDetailsPage(
                                                state.products[index]);
                                          }));
                                        },
                                        size: size,
                                        color:
                                            GlobalParams.MainColor.withOpacity(
                                                0.8),
                                        var1: state.products[index].name,
                                        var2: state.products[index].s_price,
                                        var3: state.products[index].code,
                                        var4: state.products[index].stock_min,
                                      ));
                                }));
                      }
                      return Container(
                          child: ErrorWithRefreshButtonWidget(
                        inventory: null,
                        button_function: () {
                          BlocProvider.of<ProductBloc>(context)
                              .add(LoadAllProductsEvent());
                        },
                      ));
                    }

                    return Expanded(
                        child: Container(
                      child: ListView.builder(
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          return Text("data");
                        },
                      ),
                    ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}