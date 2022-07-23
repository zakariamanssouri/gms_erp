// ignore_for_file: unused_import, unnecessary_const

import 'package:flutter/material.dart';
import 'myalert.dart';
import 'views/product.view.dart';

class HomeButton extends StatelessWidget 
{

  const HomeButton( {Key? key,required   this.buttonOption }): super(key: key);
  final ButtonOption buttonOption;  
  

 
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


class ButtonOption 
{

  const ButtonOption({this.color = const Color(0x31cdff), this.iconData=Icons.ac_unit_sharp,required this.text, required this.route});
  final Color color; 
  final String text;
  final IconData iconData;
  final String route; 

   static List<ButtonOption> Options = const <ButtonOption>[
    const ButtonOption(route: "user", text: 'CRM',iconData: Icons.home),
    const ButtonOption(route: "/inventory",text: 'Inventory',iconData: Icons.person_add),
    const ButtonOption(route: "contact",text: 'BI' ,iconData: Icons.person_pin_circle_outlined),
    const ButtonOption(route: "",text: 'Identity', iconData:Icons.production_quantity_limits_rounded),
    
    const ButtonOption(route: "user", text: '',iconData: Icons.home),
    const ButtonOption(route: "product",text: '',iconData: Icons.person_add),
    const ButtonOption(route: "contact",text: '' ,iconData: Icons.person_pin_circle_outlined),
    const ButtonOption(route: "",text: '', iconData:Icons.production_quantity_limits_rounded),
    
  ];
}