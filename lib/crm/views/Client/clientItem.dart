import 'dart:async';
import 'dart:convert';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Client/client_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Client.dart';
import 'package:gms_erp/crm/views/Client/addClientPage.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

/*class ClientItem extends StatelessWidget {
  
  int currentTab = 0;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Client"),
      ),
      body: clientItemList(),
      bottomNavigationBar: BottomNavigationBar(onTap: (int index){
        //setState(() => currentTab = index);
        }, items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Infos')),
            BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: ('Carte'))
        ]),
    );
  }
  BuildContext? get context => null;
}*/

class ClientItem extends StatefulWidget {
  Client client;
  ClientItem({Key? key, required this.client}) : super(key: key);
  @override
  _ClientItemState createState() => _ClientItemState();
}

class _ClientItemState extends State<ClientItem> {
  final Key keyOne = PageStorageKey('Infos');
  final Key keyTwo = PageStorageKey('Carte');

  int currentTab = 0;

  late PageOne one;
  late PageTwo two;
  late List<Widget> pages;
  late Widget currentPage;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    one = PageOne(
      key: keyOne,
      client: widget.client,
    );
    two = PageTwo(
      key: keyTwo,
    );

    pages = [one, two];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Client " + widget.client.no),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (int index) {
          setState(() {
            currentTab = index;
            currentPage = pages[index];
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Infos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Carte',
          ),
        ],
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  
  Client client;
  PageOne({
    Key? key,
    required this.client
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState(client: client);
}

class PageOneState extends State<PageOne> {
  
  Client client;
  PageOneState({required this.client});

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return BlocListener<ClientBloc, ClientState>(
            listener: (context, state) {
              if (state.requestState == RequestState.Error) {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  text: 'Erreur lors du chargement du client',
                );
              }
            },
            child: ListView(children: <Widget>[
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Icon(Icons.account_box_outlined,
                color: Colors.black),
                title: Text(client.getName,
                  style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300),
                ),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Icon(Icons.phone_android_outlined,
                color: Colors.black),
                title: Text(client.getPhone,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Numéro',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                    title: Text(client.getNo,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Type',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(client.getType,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Groupe',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(client.getGroup,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Pays',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(client.getCountry,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Ville',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(client.getCity,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: Text('Rue',
                    style: const TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(client.getStreet,
                    style: TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              
              Container(width: double.infinity, alignment: Alignment.bottomRight ,child: FloatingActionButton(
                onPressed: () {
                  print(client.type);
                          Navigator.push(_context,
                              MaterialPageRoute(builder: (context) {
                            return BlocProvider.value(
                              value: BlocProvider.of<ClientBloc>(
                                  _context),
                  child: AddClientPage(client: widget.client,));}));
                },
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),)
            ]));
  }
}

class PageTwo extends StatefulWidget {
  PageTwo({Key? key}) : super(key: key);

  @override
  PageTwoState createState() => PageTwoState();
}

class PageTwoState extends State<PageTwo> {
  List<Marker> allMarkers = [];

  late GoogleMapController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allMarkers.add(Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
        position: LatLng(32.339444, -6.360833)));
  }

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(32.339444, -6.360833), zoom: 11.0),
            markers: Set.from(allMarkers),
            onMapCreated: mapCreated,
          ),
        ),
        ]
      ),
    );
  }
  void mapCreated(controller) {
    setState(() {
      _controller = controller;
    });
  }

}