import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gms_erp/crm/models/Product.dart';

class ProductDetailsPage extends StatefulWidget {
  ProductDetailsPage(Product product, {Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  String barcode = "";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      floatingActionButton: FloatingActionButton(
          disabledElevation: 0,
          mini: true,
          backgroundColor: Colors.deepOrange,
          child: Icon(
            Icons.qr_code_scanner_rounded,
            size: 30,
          ),
          onPressed: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "red", "cancel", true, ScanMode.BARCODE);
            setState(() {
              barcode = barcodeScanRes;
            });
          }),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Column(
          children: [
            Text("barcode : $barcode"),
          ],
        ),
      ),
    );
  }
}
