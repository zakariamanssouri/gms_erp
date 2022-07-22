import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gms_erp/crm/widgets/side_drawer.dart';
import 'package:gms_erp/crm/models/Client.dart';
import 'package:gms_erp/crm/views/Client/clientItem.dart';
import 'package:gms_erp/crm/services/ClientService.dart';
import 'package:http/http.dart' as http;

class Clients extends StatelessWidget {
  String url;
  Clients({Key? key, required this.url}) : super(key: key);
  
  BuildContext? get context => null;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Clients"),
      ),
      body: FutureBuilder(
          future: ClientService.getClients(url, context),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? listViewWidget(snapshot.data as List<Client>)
                : Center(child: CircularProgressIndicator());
          }),
          drawer: SideDrawer(),
    );
  }

  void _navigateToClientItem(BuildContext context, Client client) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientItem(client: client)));
  }
}