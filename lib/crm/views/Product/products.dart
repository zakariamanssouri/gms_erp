import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Product/addProductPage.dart';
import 'package:gms_erp/crm/views/Product/widgets/ProductsBody.dart';


class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ProductBloc()..add(LoadAllProductsEvent()),
      child: ProductsPage(size: size),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: const Text('Produits'),
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: [
            IconButton(
          icon: Icon(
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
      ]),
      body: ProductsBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
                  Navigator.push(_context,
                      MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value: BlocProvider.of<ProductBloc>(
                          _context),
          child: AddProductPage());}));
        },
        backgroundColor: Colors.white,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
        ),
      ),
    );
  }
}
