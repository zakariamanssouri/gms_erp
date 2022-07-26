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
  const InventoyDetailsPage({this.inventory});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<InventoryDetailsBloc>(context)
      ..add(LoadInventoryDetails(inventory!.id));
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
      body: Container(
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
                        state.requestState ==
                            DetailsRequestState.SearchLoaded) {
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
                            return BlocProvider(
                              create: (context) =>
                                  BlocProvider.of<InventoryDetailsBloc>(
                                      context),
                              child: ItemCard(
                                  size: size,
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) {
                                      return ProductDetails(
                                        inventoryDetails: state.requestState ==
                                                DetailsRequestState.Loaded
                                            ? state.inventory_details[index]
                                            : state.search_result![index],
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
                                  var1: state.requestState == DetailsRequestState.Loaded
                                      ? state
                                          .inventory_details[index].productName1
                                      : state
                                          .search_result![index].productName1,
                                  var2:
                                      state.requestState == DetailsRequestState.Loaded
                                          ? state.inventory_details[index]
                                              .stockLocationName
                                          : state.search_result![index]
                                              .stockLocationName,
                                  var3: state.requestState == DetailsRequestState.Loaded
                                      ? state.inventory_details[index].productNo
                                      : state.search_result![index].productNo,
                                  var4: state.requestState == DetailsRequestState.Loaded
                                      ? "Pr: ${state.inventory_details[index].singlePrice.toStringAsFixed(2)} | "
                                      : "Pr: ${state.search_result![index].singlePrice
                                              .toStringAsFixed(2)} | ",
                                  var5: state.requestState == DetailsRequestState.Loaded
                                      ? "Qty: ${state.inventory_details[index].qty.toStringAsFixed(2)}"
                                      : "Qty: ${state.search_result![index].qty.toStringAsFixed(2)}")
                              // ProductCard(
                              //   size: size,
                              // inventoryDetails:   inventoryDetails: state.requestState ==
                              //         DetailsRequestState.Loaded
                              //     ? state.inventory_details[index]
                              //     : state.search_result![index],
                              // )
                              ,
                            );
                          },
                        ),
                      );
                    }
                    // data is loaded

                    // Error
                    return Expanded(
                        child: ErrorWithRefreshButtonWidget(
                      inventory: inventory,
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
      ),
    ));
  }
}

class ProductCard extends StatelessWidget {
  final Size size;
  final InventoryDetails inventoryDetails;
  const ProductCard(
      {Key? key, required this.inventoryDetails, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ProductDetails(inventoryDetails: inventoryDetails);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(GlobalParams.MainPadding / 4),
        width: double.infinity,
        height: size.height * 0.15,
        child: Card(
          elevation: 4,
          shadowColor: Colors.grey[300],
          // TODO:
          color: inventoryDetails.qty.toStringAsExponential(2).contains('0.00')
              ? Colors.red[400]
              : Colors.blue[400],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${inventoryDetails.productName1}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Open Sans'),
                ),
                Text(
                  '${inventoryDetails.stockLocationName}',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Open Sans'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${inventoryDetails.productNo}',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Open Sans'),
                    ),
                    Row(
                      children: [
                        Text(
                          'Pr : ${inventoryDetails.singlePrice.toStringAsFixed(2)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Open Sans'),
                        ),
                        Text(
                          " | ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Qty:${inventoryDetails.qty.toStringAsFixed(3)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Open Sans'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
