import 'package:flutter/material.dart';
import 'package:gms_erp/crm/widgets/side_drawer.dart';

class Activities extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Activités')),
      body: Center(
        child: Text(
          'This is a new screen',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
      drawer: SideDrawer(),
    );
  }
}