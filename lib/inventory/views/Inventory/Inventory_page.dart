import 'package:gms_erp/blocs/Inventory/bloc/inventory_bloc.dart';
import 'package:gms_erp/blocs/InventoryDetails/inventory_details_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/views/Inventory/widgets/InventoriesListView.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/widgets/DrawerWidget.dart';
import 'package:gms_erp/widgets/SearchField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../InventoryDetails/widgets/Header.dart';

class InventoryPage extends StatelessWidget {
  const InventoryPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<InventoryBloc>(context)..add(LoadInventories());
    return Scaffold(
      drawer: DrawerWidget(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text("Inventories",
            style: TextStyle(
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 20)),
      ),
      backgroundColor: GlobalParams.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // heaeder
              Header(
                size: size,
                child: SearchField(size: size),
              ),

              // heaeder
              SizedBox(
                height: 10,
              ),
            ]),
            BlocBuilder<InventoryBloc, InventoryState>(
              builder: (context, state) {
                // data is loading
                if (state.requestState == RequestState.Loading)
                  return Center(child: CircularProgressIndicator());
                // data is loading

                // data is loaded
                else if (state.requestState == RequestState.Loaded)
                  return InventoriesListView(inventories: state.inventories);
                // data is loaded

                // no data
                return ErrorWithRefreshButtonWidget(
                    inventory: null,
                    button_function: () {
                      BlocProvider.of<InventoryBloc>(context)
                          .add(LoadInventories());
                    });
                // no data
              },
            )
          ],
        ),
      ),
    );
  }
}
