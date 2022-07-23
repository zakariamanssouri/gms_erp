// ignore_for_file: unused_import, unnecessary_const

import 'package:flutter/material.dart';

class CRMHomeButton extends StatelessWidget 
{

  const CRMHomeButton( {Key? key,required   this.buttonOption }): super(key: key);
  final CRMButtonOption buttonOption;  
  

 
  @override
  //context a ne jamais changer
  Widget build(BuildContext context)
   {    
      final textStyle = Theme.of(context).textTheme.bodyText1;
        
        return Card(
        color: Colors.blue,
        child: Center(child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Icon(buttonOption.iconData, size:45.0, color: Colors.white)),
              // ignore: unnecessary_new
              new TextButton(
                child: Text(buttonOption.text, style: TextStyle(color: Colors.white),),
                onPressed: () {
                  print("clicked");
                  Navigator.pushNamed(context, buttonOption.route);
                },
              ),
              //  Padding(
              //    padding: const EdgeInsets.all(8),
              //    child: Text(buttonOption.text, style: textStyle,),
              //  ),

            ]
        ),
        )
    );
        
  }  
}


class CRMButtonOption 
{

  const CRMButtonOption({this.color = const Color(0x31cdff), this.iconData=Icons.ac_unit_sharp,required this.text, required this.route});
  final Color color; 
  final String text;
  final IconData iconData;
  final String route; 

   static List<CRMButtonOption> Options = const <CRMButtonOption>[
    const CRMButtonOption(route: "/Activity", text: 'Activités',iconData: Icons.dashboard),
    const CRMButtonOption(route: "/Activity",text: 'Plan de visite',iconData: Icons.calendar_month),
    const CRMButtonOption(route: "/Client",text: 'Clients' ,iconData: Icons.account_box),
    const CRMButtonOption(route: "/Activity",text: 'Contacts', iconData:Icons.contact_page),
    
    const CRMButtonOption(route: "/Activity", text: 'Opportunités',iconData: Icons.file_copy),
    const CRMButtonOption(route: "/Activity",text: 'Devis',iconData: Icons.file_download),
    const CRMButtonOption(route: "/Activity",text: 'Commandes' ,iconData: Icons.keyboard_command_key),
    const CRMButtonOption(route: "/Activity",text: 'Factures', iconData:Icons.inventory),
    const CRMButtonOption(route: "/Product",text: 'Produits', iconData:Icons.production_quantity_limits),
    
  ];
}