
  // ignore_for_file: non_constant_identifier_names
  
  import 'package:flutter/material.dart';
  
  class MyAlert{

   static showAlertDialog(BuildContext context,String title ,String content)
   {  
    // Create button  
    Widget YesButton = TextButton(  
      child: const Text("Done"),  
      onPressed: () {  
        Navigator.of(context,rootNavigator: true).pop();
        },  
      );
      // Widget NoButton = TextButton(  
     // child: const Text("Non"),  
      //onPressed: () {  
        //Navigator.of(context,rootNavigator: true).pop();
        //},  
      //);  
    
    // Create AlertDialog  
    AlertDialog alert = AlertDialog(  
      title:  Text(title),  
      content:  Text(content),  
      actions: [  
        YesButton,
      ],  
    );  
    
    // show the dialog  
        showDialog(  
      context: context,  
      builder: (BuildContext context) {  
        return alert;  
      },  
    );  
  } 
}