// ignore_for_file: sort_child_properties_last, prefer_final_fields
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../config/menu.dart';
import '../../../homepage.dart';
import '../../../widgets/homebutton.dart';

class SettingsPage extends StatefulWidget 
{
  SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>
 {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
          body: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                      key: _formKey,
                      child: ListView(
                            children:[
                             const SizedBox(height:35),
                             Container(
                              decoration: const BoxDecoration(borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),), ),
                              child:CircleAvatar(
                                   radius: 80.0,
                                   child: ClipRRect(
                                       child: Image.asset('assets/images/logo.png'),
                                       borderRadius: BorderRadius.circular(10.0),), ),),
                                const SizedBox(height:10),
                                Text(' Merci de saisir le nom du domaine avant de continuer',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize:13,),),
                                const SizedBox(height:20),
                                TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                decoration: const InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                hintText: 'Domaine',
                                labelText: 'Domaine',
                                prefixIcon: Icon(Icons.domain,color: Color(0xff00A3EE),),),
                                validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire')]),
                                ),
                                const SizedBox(height:15),
                                ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()){
                                      
                                  }},
                                  style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(240, 40), 
                                  primary: Colors.blue), 
                                  
                                child: const Text('Confirmer'),
                              ),
                            ],
                      ),
                  ),
           ),);
     
  }
}