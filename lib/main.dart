

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Inventory/bloc/inventory_bloc.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';

import 'blocs/ProductDetails/bloc/product_details_bloc.dart';
import 'inventory/views/Inventory/Inventory_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InventoryBloc>(
          create: (context) => InventoryBloc()..add(LoadInventories()),
        ),
        BlocProvider<ProductDetailsBloc>(
            create: (context) => ProductDetailsBloc()),
      ],
      child: MaterialApp(
        routes: {
          '/inventory': (context) => InventoryPage(),
          '/inventory_details': (context) => InventoyDetailsPage(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: InventoryPage(),
      ),
    );
  }
}