import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/inventory/views/Products/Details/product_details.dart';
import 'package:gms_erp/widgets/ItemCard.dart';

class ProductsListView extends StatelessWidget {
  List<Product> products;
  ProductsListView({
    Key? key,
    required this.size,
    required this.products,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Container(
        height: size.height * 0.78,
        padding: EdgeInsets.only(
            top: GlobalParams.MainPadding / 2,
            left: GlobalParams.MainPadding / 3,
            right: GlobalParams.MainPadding / 4),
        child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (BuildContext context, int index) {
              return ItemCard(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value: BlocProvider.of<ProductBloc>(_context),
                      child: ProductDetailsPage(product: products[index]),
                    );
                  }));
                },
                size: size,
                var1: products[index].name,
                var2: products[index].s_price,
                var3: products[index].code,
              );
            }));
  }
}
