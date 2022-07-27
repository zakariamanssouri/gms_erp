import 'package:flutter/material.dart';
import 'package:gms_erp/crm/views/Client/clientItem.dart';
import 'package:gms_erp/widgets/SearchField.dart';
import 'package:gms_erp/blocs/Client/client_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import '../../../widgets/ItemCard.dart';

class Clients extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      backgroundColor: GlobalParams.backgroundColor,
      appBar: AppBar(
        title: Text('Clients'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: BlocProvider(
        create: (context) =>
            ClientBloc()..add(LoadClients()),
        child: ClientsBody(size: size),
      ),
    ));
  }
}

class ClientsBody extends StatelessWidget {
  ClientsBody({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Header(
            size: size / 1.5,
            child: SearchField(
                size: size / 1.4,
                onchanged_function: (String value) {
                  BlocProvider.of<ClientBloc>(context).add(
                    SearchClientEvent(
                        value,
                        BlocProvider.of<ClientBloc>(context)
                            .state
                            .clients),
                  );
                }),
          ),
          Expanded(
            child: BlocBuilder<ClientBloc, ClientState>(
                builder: (context, state) {
              print("request state:${state.requestState}");
              // data is loading
              if (state.requestState == RequestState.Loading ||
                  state.requestState == RequestState.Searching)
                return Container(
                  height: size.height * 0.5,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              // data is loading
              // data is loaded
              else if (state.requestState == RequestState.Loaded ||
                  state.requestState == RequestState.SearchLoaded) {
                return Container(
                  height: size.height * 0.78,
                  padding: EdgeInsets.only(
                      top: GlobalParams.MainPadding / 2,
                      left: GlobalParams.MainPadding / 3,
                      right: GlobalParams.MainPadding / 4),
                  child: ListView.builder(
                    itemCount: state.requestState == RequestState.Loaded
                        ? state.clients.length
                        : state.search_result?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ItemCard(
                          size: size,
                          onPressed: () {
                            print("lenghth here");
                            ClientBloc bloc =
                                BlocProvider.of<ClientBloc>(context);
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return BlocProvider.value(
                                value: BlocProvider.of<ClientBloc>(
                                    _context),
                                child: ClientItem(
                                  client: state.requestState ==
                                          RequestState.Loaded
                                      ? state.clients[index]
                                      : state.search_result![index],
                                ),
                              );
                            }));
                          },
                          color:
                              Colors.white,
                          var1: state.requestState == RequestState.Loaded
                              ? state.clients[index].no
                              : state.search_result![index].no,
                          var2: state.requestState == RequestState.Loaded
                              ? state.clients[index].name
                              : state.search_result![index].name,
                          var3: state.requestState == RequestState.Loaded
                              ? state.clients[index].country
                              : state.search_result![index].country,
                          var4: state.requestState == RequestState.Loaded
                              ? state.clients[index].type
                              : state.search_result![index].type,
                              textcolor: Colors.black);
                    },
                  ),
                );
              }
              // data is loaded

              // Error
              return ErrorWithRefreshButtonWidget(
                inventory: null,
                button_function: () {
                  BlocProvider.of<ClientBloc>(context)
                      .add(LoadClients());
                },
              );
              // Error
            }),
          )
        ],
      ),
    );
  }
}
