
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Inventory/bloc/inventory_bloc.dart';
import 'package:gms_erp/blocs/Client/client_bloc.dart';
import 'package:gms_erp/blocs/InventoryDetails/inventory_details_bloc.dart';
import 'package:gms_erp/homepage.dart';
import 'identity/views/Sign in/userlogin.views.dart';
import 'identity/views/user.view.dart';
import 'identity/views/useradd.view.dart';


void main() {
  runApp(MultiBlocProvider(providers: [
     BlocProvider<InventoryBloc>(
          create: (context) => InventoryBloc(),
        ),
       BlocProvider<InventoryDetailsBloc>(
          create: (context) => InventoryDetailsBloc(),
        ),
        BlocProvider<ClientBloc>(
          create: (context) => ClientBloc(),
        ),
      
  ],child: MaterialApp(
     home: UserLogin())));
}




