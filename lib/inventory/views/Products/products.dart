import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/views/Products/widgets/ProductsPageBody.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          disabledElevation: 0,
          backgroundColor: Colors.purple[900],
          child: Icon(
            Icons.qr_code_scanner_rounded,
            size: 30,
          ),
          onPressed: () async {
            print(BlocProvider.of<ProductBloc>(_context));
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "blue", "cancel", false, ScanMode.BARCODE);
            BlocProvider.of<ProductBloc>(context).add(SearchProductEvent(
                search_value: barcodeScanRes,
                product_list:
                    BlocProvider.of<ProductBloc>(context).state.products));
          }),
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: const ProductsPageBody(),
    );
  }
}
