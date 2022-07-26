import 'package:gms_erp/crm/models/Client.dart';
import 'package:gms_erp/crm/services/ClientService.dart';
import 'package:gms_erp/crm/views/Client/clientItem.dart';
import 'package:flutter/material.dart';
import 'package:gms_erp/widgets/ItemCard.dart';




class ClientsListView extends StatelessWidget {
  List<Client> clients;
  ClientsListView({required this.clients});


  @override
  Widget build(BuildContext context) {
      return Expanded(
      child: Container(
        child: ListView.builder(
          itemCount: clients.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemCard(size: MediaQuery.of(context).size,color: Colors.white,
            textcolor: Colors.black,
            var1: clients[index].no, var2: clients[index].type, var3: clients[index].country,
             var5: clients[index].group,
             onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ClientItem(client: clients[index]);
          },
        ),
        );
          });
        }
        )));
  }
}