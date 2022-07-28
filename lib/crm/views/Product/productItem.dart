import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Product.dart';

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
    // TODO: implement initState
    barcode = widget.product.code;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        title: Text('Produit'),
      ),
      body: Container(
        margin: EdgeInsets.all(GlobalParams.MainPadding),
        padding: EdgeInsets.all(GlobalParams.MainPadding),
        height: size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(10, 20),
              spreadRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("Numero : ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans')),
                Text("${widget.product.no}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Open Sans')),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text("Nom       :  ",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans')),
                Flexible(
                  child: Wrap(children: [
                    Text("${widget.product.name}",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: GlobalParams.MainfontSize,
                            fontWeight: FontWeight.w300,
                            fontFamily: 'Open Sans')),
                  ]),
                ),
              ],
            ),
            Row(
              children: [
                Text("barcode : ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans')),
                Text("${barcode}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Open Sans')),
                Spacer(),
                FloatingActionButton(
                    disabledElevation: 0,
                    mini: true,
                    backgroundColor: Colors.deepOrange,
                    child: Icon(
                      Icons.qr_code_scanner_rounded,
                      size: 30,
                    ),
                    onPressed: () async {
                      String barcodeScanRes =
                          await FlutterBarcodeScanner.scanBarcode(
                              "red", "cancel", true, ScanMode.BARCODE);
                      setState(() {
                        barcode = barcodeScanRes;
                      });
                    }),
              ],
            ),
            Row(
              children: [
                Text("Stock Min : ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans')),
                Text("${widget.product.stock_min}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Open Sans')),
              ],
            ),
            Row(
              children: [
                Text("Prix : ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans')),
                Text("${widget.product.s_price}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Open Sans')),
              ],
            ),
            Row(
              children: [
                Text("Prix Min : ",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Open Sans')),
                Text("${widget.product.s_price_min}",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: GlobalParams.MainfontSize,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'Open Sans')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
