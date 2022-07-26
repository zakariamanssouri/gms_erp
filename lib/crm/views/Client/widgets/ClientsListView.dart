import 'package:gms_erp/crm/models/Client.dart';
import 'package:gms_erp/crm/services/ClientService.dart';
import 'package:gms_erp/crm/views/Client/widgets/ClientCard.dart';
import 'package:flutter/material.dart';




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
            return ClientCard(size: MediaQuery.of(context).size,client: clients[index]);
          },
        ),
      ),
    );
  }
}