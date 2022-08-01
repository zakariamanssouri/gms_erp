import 'dart:ui';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/crm/views/Product/addProductPage.dart';
import 'package:gms_erp/widgets/ButtonWidget.dart';

class ProductItem extends StatefulWidget {
  Product product;
  ProductItem({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  String barcode = "";

  @override
  void initState() {
    barcode = widget.product.code;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BuildContext _context = context;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Produit'),
        ),
        body: BlocListener<ProductBloc, ProductState>(
            listener: (context, state) {
              if (state.requestState == ProductRequestState.Updating) {
              } else if (state.requestState == ProductRequestState.Updated) {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  text: 'le produit a été mis à jour avec succès',
                );
                BlocProvider.of<ProductBloc>(context)
                    .add(LoadAllProductsEvent());
                Navigator.pop(context);
                // BlocProvider.of<ProductBloc>(context)
                //     .add(LoadAllProductsEvent());
                // Navigator.pop(context); // error on updating
              } else if (state.requestState == ProductRequestState.Error) {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  text: 'Erreur lors de la mise à jour du produit',
                );
              }
            },
            child: ListView(children: <Widget>[
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Numéro',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(
                  widget.product.no,
                  style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300),
                ),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Noms',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.name,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Code Bar',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(barcode,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
                trailing: FloatingActionButton(
                    heroTag: 'barcode-button',
                    disabledElevation: 0,
                    mini: true,
                    backgroundColor: Colors.deepOrange,
                    child: Icon(
                      Icons.qr_code_scanner_rounded,
                      size: 20,
                    ),
                    onPressed: () async {
                      String barcodeScanRes =
                          await FlutterBarcodeScanner.scanBarcode(
                              "blue", "cancel", true, ScanMode.BARCODE);
                      setState(() {
                        barcode = barcodeScanRes;
                        widget.product.code = barcode;
                      });
                    }),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Stock Min',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.stock_min,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Prix',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.s_price,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Prix Min',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.s_price_min,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Container(
                  margin: EdgeInsets.only(
                      top: GlobalParams.MainPadding / 2,
                      right: GlobalParams.MainPadding / 2,
                      left: GlobalParams.MainPadding / 2),
                  child: ButtonWidget(
                      size: size,
                      onPressed: () async {
                        BlocProvider.of<ProductBloc>(context)
                          ..add(
                            UpdateProductEvent(product: widget.product),
                          );

                        // print(BlocProvider.of<ProductBloc>(context)
                        //     .state
                        //     .requestState);
                        // if (BlocProvider.of<ProductBloc>(context)
                        //         .state
                        //         .requestState ==
                        //     RequestState.Error) {
                        //   print("hit here");
                        // }

                        // if (BlocProvider.of<ProductBloc>(context)
                        //         .state
                        //         .requestState !=
                        //     ProductRequestState.Error) {
                        //   CoolAlert.show(
                        //       context: context,
                        //       type: CoolAlertType.success,
                        //       text: "le produit a été mis à jour avec succès");
                        //   Navigator.pop(context);
                        // }
                      },
                      text: "Modifier"))
            ])),
            floatingActionButton: FloatingActionButton(
        onPressed: () {
                  Navigator.push(_context,
                      MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value: BlocProvider.of<ProductBloc>(
                          _context),
          child: AddProductPage(product: widget.product,));}));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.edit,
          color: Colors.blue,
        ),
      ),
            );
  }
}
