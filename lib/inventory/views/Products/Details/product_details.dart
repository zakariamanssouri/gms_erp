import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/widgets/ButtonWidget.dart';

class ProductDetailsPage extends StatefulWidget {
  Product product;
  ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String barcode = "";

  @override
  void initState() {
    barcode = widget.product.code;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Produit : ${widget.product.no}'),
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
                    .add(const LoadAllProductsEvent());
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
                leading: const Text('Code Bar',
                    style:  TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(barcode,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
                trailing: FloatingActionButton(
                    heroTag: 'barcode-button',
                    disabledElevation: 0,
                    mini: true,
                    backgroundColor: Colors.deepOrange,
                    child:const Icon(
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
                leading: const Text('Unité',
                    style:  TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.measure ?? "",
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Category',
                    style:  TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(
                    "${widget.product.product_group} / ${widget.product.product_type}",
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                      minLeadingWidth: 70,
                      leading: const Text('Actif',
                          style:  TextStyle(
                              fontFamily: GlobalParams.MainfontFamily,
                              fontWeight: FontWeight.w900)),
                      title: Container(
                        alignment: Alignment.centerLeft,
                        child: widget.product.is_active == 0
                            ?const  Icon(Icons.lock)
                            :const  Icon(Icons.lock_open),
                      ))),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Prix',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.s_price,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading:const Text('Prix Min',
                    style:  TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.s_price_min,
                    style: const TextStyle(
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
                        BlocProvider.of<ProductBloc>(context).add(
                          UpdateProductEvent(product: widget.product),
                        );
                      },
                      text: "Enregistrer"))
            ])));
  }
}
