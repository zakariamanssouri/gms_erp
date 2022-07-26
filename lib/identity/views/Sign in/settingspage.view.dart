// ignore_for_file: sort_child_properties_last, prefer_final_fields, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gms_erp/identity/views/Sign%20in/userlogin.views.dart';
import '../../../config/global_params.dart';
import '../../../config/menu.dart';
import '../../../homepage.dart';
import '../../../widgets/homebutton.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget 
{
  SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage>
 {
  String domainame="";
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final namedomainController = TextEditingController();

  @override
   void initState() { 
    super.initState();
    _read();
    
  }
    _read() async 
    {
        final prefs = await SharedPreferences.getInstance();
        final key = GlobalParams.key_domain;
        final value = prefs.getString(key) ?? "";
        namedomainController.text = value;
        print('read: $value');
      }
      
    _save(String value) async 
      {
        final prefs = await SharedPreferences.getInstance();
        final key = GlobalParams.key_domain;
        prefs.setString(key, value);
        print('saved $value');
      }

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
                                const Text(' Merci de saisir le nom du domaine avant de continuer',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize:13,),),
                                const SizedBox(height:20),
                                TextFormField(
                                   controller: namedomainController,
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
                                onPressed: () async {
                                  if (_formKey.currentState!.validate())
                                  {
                                      _save(namedomainController.text);
                                       final prefs = await SharedPreferences.getInstance();
                                       prefs.setString('key_domain', GlobalParams.key_domain);
                                       print(namedomainController.text);
                                       Navigator.pop(context);
                                  }
                               },
                    
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