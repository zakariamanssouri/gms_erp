import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/blocs/stock/stock_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/models/stock.dart';
import 'package:gms_erp/widgets/ButtonWidget.dart';

class StockDetailsPage extends StatefulWidget {
  Stock product;
  StockDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  State<StockDetailsPage> createState() => _StockDetailsPageState();
}

class _StockDetailsPageState extends State<StockDetailsPage> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('Produit : ${widget.product.productNo}'),
        ),
        body: BlocListener<StockBlock, StockState>(
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
                  widget.product.productNo!,
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
                title: Text(widget.product.productName1!,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Code Bar',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.eanCode!,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Prix',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.purchasePrice ?? "",
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Location',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text("${widget.product.locationName}",
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Ground',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(widget.product.groundName ?? "",
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
            ])));
  }
}
