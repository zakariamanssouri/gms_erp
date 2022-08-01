import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/blocs/stock/stock_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/inventory/models/stock.dart';
import 'package:gms_erp/inventory/views/Products/Details/product_details.dart';
import 'package:gms_erp/inventory/views/stock/widgets/stock_details.dart';
import 'package:gms_erp/widgets/ItemCard.dart';

class StockListView extends StatelessWidget {
  List<Stock> products;
  StockListView({
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return BlocProvider.value(
                      value: BlocProvider.of<StockBlock>(_context),
                      child: StockDetailsPage(product: products[index]),
                    );
                  }));
                },
                size: size,
                var1: products[index].productName1,
                var2: products[index].purchasePrice,
                var3: products[index].eanCode,
              );
            }));
  }
}
