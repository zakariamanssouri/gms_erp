import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/blocs/stock/stock_bloc.dart';
import 'package:gms_erp/config/menu.dart';
import 'package:gms_erp/homepage.dart';
import 'package:gms_erp/inventory/views/Inventory/inventories_page.dart';
import 'package:gms_erp/inventory/views/Products/products.dart';
import 'package:gms_erp/inventory/views/stock/Stock.dart';
import 'package:gms_erp/widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:gms_erp/widgets/homebutton.dart';

class InventoryHomePage extends StatelessWidget {
  InventoryHomePage({
    Key? key,
  }) : super(key: key);
  final GlobalKey<ScaffoldState>? _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/inventories': (context) => InventoriesPage(),
          '/home': (context) => HomePage(),
          '/products': (context) => BlocProvider<ProductBloc>(
                create: (context) => ProductBloc()..add(LoadAllProductsEvent()),
                child: ProductsPage(),
              ),
          '/stock': (context) => BlocProvider(
                create: (context) => StockBlock()..add(const LoadStockEvent()),
                child: StockPage(),
              ),
        },
        title: 'GMS inventory',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _key,
          drawer: DrawerWidget(),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {
                      _key?.currentState!.openDrawer();
                    }),
                IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Text(
                  'GMS Inventaires',
                )),
              ],
            ),
          ),
          body: GridView.count(
            padding: const EdgeInsets.all(60),
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            children:
                List.generate(ButtonOption.InventoryOptions.length, (index) {
              var bOption = ButtonOption.InventoryOptions[index];
              return Center(
                child: HomeButton(buttonOption: bOption),
              );
            }),
          ),
        ));
  }
}
