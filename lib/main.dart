

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






// class MyApp2 extends StatelessWidget {
//   const MyApp2({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<InventoryBloc>(
//           create: (context) => InventoryBloc()..add(LoadInventories()),
//         ),
//         BlocProvider<ProductDetailsBloc>(
//             create: (context) => ProductDetailsBloc()),
//       ],
//       child: MaterialApp(
//         routes: {
//           '/inventory': (context) => InventoryPage(),
//           '/inventory_details': (context) => InventoyDetailsPage(),
//         },
//         debugShowCheckedModeBanner: false,
//         title: 'Flutter Demo',
//         home: InventoryPage(),
//       ),
//     );
//   }
// }