import 'package:flutter/material.dart';
import 'package:gms_erp/crm/models/Client.dart';
import 'package:gms_erp/crm/views/Client/clientItem.dart';

import 'package:gms_erp/crm/views/Client/clients.dart';

import '../../../../config/global_params.dart';


class ClientCard extends StatelessWidget {
  final Size size;
  final Client client;
  const ClientCard({Key? key, required this.client, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return ClientItem(client: client);
        }));
      },
      child: Container(
        padding: EdgeInsets.all(GlobalParams.MainPadding / 70),
        width: double.infinity,
        height: size.height * 0.15,
        child: Card(
          elevation: 4,
          shadowColor: Colors.grey[300], 
        child: Padding(
            padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${client.no}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                      fontWeight: FontWeight.bold,
                          fontFamily: 'Open Sans'),
                    ),
                    Row(
                      children: [
                        Text(
                          '${client.type}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Open Sans'),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${client.country}',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                              fontWeight: FontWeight.w300,
                          fontFamily: 'Open Sans'),
                    ),
                    Row(
                      children: [
                        Text(
                          '${client.group}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Open Sans'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
          ),
      ),
        ),)
    );
  }
}

