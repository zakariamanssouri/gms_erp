import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:gms_erp/blocs/Inventory/bloc/inventory_bloc.dart';
import 'package:gms_erp/blocs/InventoryDetails/inventory_details_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/config/menu.dart';
import 'package:gms_erp/homepage.dart';
import 'package:gms_erp/inventory/views/Inventory/inventories_page.dart';
import 'package:gms_erp/inventory/views/Inventory/widgets/InventoriesListView.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/widgets/DrawerWidget.dart';
import 'package:gms_erp/widgets/SearchField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/widgets/homebutton.dart';
import 'views/InventoryDetails/widgets/Header.dart';

class InventoryHomePage extends StatelessWidget {
  const InventoryHomePage({
    Key? key,
  }) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          '/inventories': (context) => InventoriesPage(),
          '/home': (context) => HomePage(),
          '/products': (context) => ProductsPage(),
        },
        title: 'GMS inventory',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          drawer: DrawerWidget(),
          appBar: AppBar(
            title: const Text('GMS inventory'),
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

class ProductsPage extends StatelessWidget {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("widget built");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalParams.backgroundColor,
      floatingActionButton: FloatingActionButton(
          disabledElevation: 0,
          child: Icon(
            Icons.qr_code_scanner_rounded,
            size: 40,
          ),
          onPressed: () async {
            String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                "red", "cancel", true, ScanMode.BARCODE);
          }),
      appBar: AppBar(
        title: const Text('Products'),
        elevation: 0,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Container(
          child: Column(
            children: [
              Header(
                size: size / 1.5,
                child: SearchField(
                    size: size / 1.4,
                    onchanged_function: (String value) {
                      BlocProvider.of<InventoryDetailsBloc>(context).add(
                        SearchProductEvent(
                            value,
                            BlocProvider.of<InventoryDetailsBloc>(context)
                                .state
                                .inventory_details),
                      );
                    }),
              ),
              SizedBox(
                height: 4,
              ),
              Expanded(
                  child: Container(
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Text("data");
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
