import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/crm/models/Client.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Client"),
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
    return ListView(
        children: <Widget>[
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Icon(Icons.account_box_outlined,
          color: Colors.black),
          title: Text(client.getName),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Icon(Icons.phone_android_outlined,
          color: Colors.black),
          title: Text(client.getPhone),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Numéro', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(client.getNo),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Type', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(client.getType),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Groupe', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(client.getGroup),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Pays', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(client.getCountry),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Ville', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(client.getCity),
        )),
        Card(child: ListTile(
          minLeadingWidth: 60,
          leading: Text('Rue', style: const TextStyle(fontWeight: FontWeight.bold)),
          title: Text(client.getStreet),
        )),
      ]
        );
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