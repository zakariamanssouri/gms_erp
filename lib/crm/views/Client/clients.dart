
import 'package:flutter/material.dart';
import 'package:gms_erp/crm/widgets/side_drawer.dart';
import 'package:gms_erp/widgets/SearchField.dart';

import 'package:gms_erp/blocs/Client/client_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Client/widgets/ClientsListView.dart';
import 'package:gms_erp/crm/views/Client/widgets/Header.dart';
import 'package:gms_erp/widgets/DrawerWidget.dart';
import 'package:gms_erp/crm/views/Client/widgets/ClientCard.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';

class Clients extends StatelessWidget {

  const Clients({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BlocProvider.of<ClientBloc>(context)..add(LoadClients());
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text("Clients",
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
                size: size / 20,
                child: SearchField(size: size),
              ),

              // heaeder
              SizedBox(
                height: 5,
              ),
            ]),
            BlocBuilder<ClientBloc, ClientState>(
              builder: (context, state) {
                // data is loading
                if (state.requestState == RequestState.Loading)
                  return Center(child: CircularProgressIndicator());
                // data is loading

                // data is loaded
                else if (state.requestState == RequestState.Loaded)
                  return ClientsListView(clients: state.clients);
                // data is loaded

                // no data
                return ErrorWithRefreshButtonWidget(
                    button_function: () {
                      BlocProvider.of<ClientBloc>(context)
                          .add(LoadClients());
                    }, inventory: null,);
                // no data
              },
            )
          ],
        ),
      ),
    );
  }
}























  
  /*String url;
  Clients({Key? key, required this.url}) : super(key: key);

  @override
  _clientsState createState() => _clientsState();
}

class _clientsState extends State<Clients>{
  List<Client> allClients = [];
  List<Client> foundClients = [];

  Widget listViewWidget(List<Client> client) {
    return Container(
      child: ListView.builder(
        itemCount: client.length,
          itemBuilder: (context, position) {
            return Card(
              child: ListTile(
                leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                  '${client[position].no}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black),
                ), 
                Text(
                  '${client[position].country}',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey),
                ),
                      ]),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                        '${client[position].name}',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black),
                      ),
                      Text(
                  '${client[position].type}',
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey),
                ),
                      ]),
            onTap: () {
            _navigateToClientItem(context, client[position]);
          }
              ),
            );
          }),
    );
  }

  void initState(){
    allClients = ClientService.getClients(widget.url, context) as List<Client>;
    foundClients = allClients;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Clients"),
        shape: SearchField(size: size / 1.5 , )
      ),
      body: Builder(
          builder: (context) {
            return foundClients != null
                ? listViewWidget(foundClients)
                : Center(child: CircularProgressIndicator());
          }),
          drawer: SideDrawer(),
    );
  }

  void _navigateToClientItem(BuildContext context, Client client) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientItem(client: client)));
  }
}*/