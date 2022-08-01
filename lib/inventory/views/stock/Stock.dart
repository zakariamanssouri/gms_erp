import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/blocs/stock/stock_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/views/Products/widgets/ProductsPageBody.dart';
import 'package:gms_erp/inventory/views/stock/widgets/stock_body.dart';

class StockPage extends StatelessWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          disabledElevation: 0,
          backgroundColor: Colors.purple[900],
          child: const Icon(
            Icons.qr_code_scanner_rounded,
            size: 30,
          ),
          onPressed: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "blue", "cancel", false, ScanMode.BARCODE);
            BlocProvider.of<StockBlock>(context).add(SearchStockEvent(
                search_value: barcodeScanRes,
                product_list:
                    BlocProvider.of<StockBlock>(context).state.products));
          }),
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: const Text('Stock'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: const StockPageBody(),
    );
  }
}
