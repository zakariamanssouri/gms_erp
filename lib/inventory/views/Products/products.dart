import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/views/Products/widgets/ProductsPageBody.dart';


class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(const LoadAllProductsEvent()),
        child: const ProductsPageBody(),
      ),
    );
  }
}
