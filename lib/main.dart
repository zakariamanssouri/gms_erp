
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Inventory/bloc/inventory_bloc.dart';
import 'package:gms_erp/blocs/InventoryDetails/inventory_details_bloc.dart';
import 'package:gms_erp/identity/main.dart';


void main() {
  runApp(MultiBlocProvider(providers: [
     BlocProvider<InventoryBloc>(
          create: (context) => InventoryBloc(),
        ),
       BlocProvider<InventoryDetailsBloc>(
          create: (context) => InventoryDetailsBloc(),
        ),
      
  ],child: MyApp()));
}




