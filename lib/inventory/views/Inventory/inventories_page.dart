import 'package:gms_erp/blocs/Inventory/bloc/inventory_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/views/Inventory/widgets/InventoriesListView.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/widgets/DrawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InventoriesPage extends StatelessWidget {
  const InventoriesPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => InventoryBloc()..add(LoadInventories()),
      child: Scaffold(
        drawer: DrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.blue,
          elevation: 0,
          title: Text("Inventaires"),
        ),
        backgroundColor: GlobalParams.backgroundColor,
        body: SafeArea(
          child: Column(
            children: [
              BlocBuilder<InventoryBloc, InventoryState>(
                builder: (context, state) {
                  // data is loading
                  if (state.requestState == RequestState.Loading)
                    return Expanded(
                        child: Center(child: CircularProgressIndicator()));
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
      ),
    );
  }
}
