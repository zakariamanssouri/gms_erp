import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Product/addProductPage.dart';
import 'package:gms_erp/crm/views/Product/widgets/ProductsPageBody.dart';
import 'package:gms_erp/inventory/views/Products/widgets/ProductsPageBody.dart';


class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: const Text('Produits'),
        elevation: 0,
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddProductPage()));
                              }, icon: Icon(Icons.add))],
      ),
      body: BlocProvider(
        create: (context) => ProductBloc()..add(const LoadAllProductsEvent()),
        child: const ProductsBody(),
      ),
    );
  }
}
