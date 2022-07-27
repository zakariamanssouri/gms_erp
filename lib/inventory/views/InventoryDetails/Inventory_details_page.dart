import 'package:gms_erp/blocs/InventoryDetails/inventory_details_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/Header.dart';
import 'package:gms_erp/widgets/ItemCard.dart';
import 'package:gms_erp/widgets/SearchField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../ProductDetails/ProductDetails.dart';
import 'widgets/ErrorWithRefreshButtonWidget.dart';

class InventoyDetailsPage extends StatelessWidget {
  final Inventory? inventory;
  InventoyDetailsPage({this.inventory});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: Text(
          inventory?.description ?? "",
          style: TextStyle(overflow: TextOverflow.fade),
        ),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) =>
            InventoryDetailsBloc()..add(LoadInventoryDetails(inventory!.id)),
        child: InventoryDetailsBody(size: size, inventory: inventory),
      ),
    ));
  }
}

class InventoryDetailsBody extends StatelessWidget {
  InventoryDetailsBody({
    Key? key,
    required this.size,
    required this.inventory,
  }) : super(key: key);

  final Size size;
  final Inventory? inventory;

  @override
  Widget build(BuildContext context) {
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
                  BlocProvider.of<InventoryDetailsBloc>(context).add(
                    SearchProductEvent(
                        value,
                        BlocProvider.of<InventoryDetailsBloc>(context)
                            .state
                            .inventory_details),
                  );
                }),
          ),
          Expanded(
            child: BlocConsumer<InventoryDetailsBloc, InventoryDetailsState>(
                listener: (context, state) {},
                builder: (context, state) {
                  // data is loading
                  if (state.requestState == DetailsRequestState.Loading ||
                      state.requestState == DetailsRequestState.Searching)
                    return Container(
                      height: size.height * 0.5,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    );

                  // data is loading
                  // data is loaded
                  else if (state.requestState == DetailsRequestState.Loaded ||
                      state.requestState == DetailsRequestState.SearchLoaded) {
                    return Container(
                      height: size.height * 0.78,
                      padding: EdgeInsets.only(
                          top: GlobalParams.MainPadding / 2,
                          left: GlobalParams.MainPadding / 3,
                          right: GlobalParams.MainPadding / 4),
                      child: ListView.builder(
                        itemCount:
                            state.requestState == DetailsRequestState.Loaded
                                ? state.inventory_details.length
                                : state.search_result?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemCard(
                              size: size,
                              onPressed: () {
                                print("lenghth here");
                                InventoryDetailsBloc bloc = BlocProvider.of<InventoryDetailsBloc>(context);
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return BlocProvider(
                                    create: (context) => bloc,
                                    child: ProductDetails(
                                      inventoryDetails: state.requestState ==
                                              DetailsRequestState.Loaded
                                          ? state.inventory_details[index]
                                          : state.search_result![index],
                                    ),
                                  );
                                }));
                              },
                              color: state.requestState ==
                                      DetailsRequestState.Loaded
                                  ? state.inventory_details[index].qty
                                          .toStringAsFixed(2)
                                          .startsWith('0.00')
                                      ? Colors.red[400]
                                      : Colors.blue[400]
                                  : state.search_result![index].qty
                                          .toStringAsFixed(2)
                                          .startsWith('0.00')
                                      ? Colors.red[400]
                                      : Colors.blue[400],
                              var1: state.requestState ==
                                      DetailsRequestState.Loaded
                                  ? state.inventory_details[index].productName1
                                  : state.search_result![index].productName1,
                              var2: state.requestState ==
                                      DetailsRequestState.Loaded
                                  ? state.inventory_details[index]
                                      .stockLocationName
                                  : state
                                      .search_result![index].stockLocationName,
                              var3:
                                  state.requestState == DetailsRequestState.Loaded
                                      ? state.inventory_details[index].productNo
                                      : state.search_result![index].productNo,
                              var4: state.requestState ==
                                      DetailsRequestState.Loaded
                                  ? "Pr: ${state.inventory_details[index].singlePrice.toStringAsFixed(2)} | "
                                  : "Pr: ${state.search_result![index].singlePrice.toStringAsFixed(2)} | ",
                              var5: state.requestState ==
                                      DetailsRequestState.Loaded
                                  ? "Qty: ${state.inventory_details[index].qty.toStringAsFixed(2)}"
                                  : "Qty: ${state.search_result![index].qty.toStringAsFixed(2)}");
                        },
                      ),
                    );
                  }
                  // data is loaded

                  // Error
                  return Expanded(child: ErrorWithRefreshButtonWidget(
                    inventory: null,
                    button_function: () {
                      BlocProvider.of<InventoryDetailsBloc>(context)
                          .add(LoadInventoryDetails(inventory!.id));
                    },
                  ));
                  // Error
                }),
          )
        ],
      ),
    );
  }
}
