// ignore_for_file: sort_child_properties_last, prefer_final_fields
import 'package:flutter/material.dart';
import '../../../config/global_params.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gms_erp/identity/views/Sign%20in/settingspage.view.dart';
import '../../../config/menu.dart';
import '../../../homepage.dart';
import '../../../widgets/homebutton.dart';
import '../user.view.dart';
import '../useradd.view.dart';

class UserLogin extends StatefulWidget 
{
  UserLogin({Key? key}) : super(key: key);
  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin>
 {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
        GlobalParams.baseUrl = value;
        print('read: $value');
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
                                Container(
                                  alignment: Alignment.topRight,
                                  child:IconButton(
                                  iconSize: 40.0,
                                  icon: const Icon(Icons.settings_outlined),
                                  color: Colors.blue,
                                  onPressed: () 
                                  {
                                    Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => SettingsPage(),
                                          ));
                                  },
                                ),
                                ),
                               Container(
                                decoration: const BoxDecoration(borderRadius:  BorderRadius.only(
                                bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),), ),
                                child:CircleAvatar(
                                     radius: 80.0,
                                     child: ClipRRect(
                                         child: Image.asset('assets/images/logo.png'),
                                         borderRadius: BorderRadius.circular(10.0),), ),),
                                  const SizedBox(height:10),
                                  const SizedBox(height:15),
                                  TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Adresse Email',
                                  labelText: 'Adresse Email',
                                  prefixIcon: Icon(Icons.email,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire'),EmailValidator(errorText: 'Votre email est invalide')]),
                                  ),
                                  const SizedBox(height:10),
                                  const SizedBox(height:10),
                                  TextFormField(
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  obscureText:true,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Mot de passe',
                                  labelText: 'Mot de passe',
                                  prefixIcon: Icon(Icons.lock,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire'),]),
                                  ),
                                  const SizedBox(height:15),
                                  ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()){
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomePage(),
                                        ));
                                    }},
                                    style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(240, 40), 
                                    primary: Colors.blue), 
                                    
                                  child: const Text('Se Connecter'),
                                ),
                                const SizedBox(height:20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      Text("Si vous n'avez pas de compte",textAlign: TextAlign.center,style: TextStyle(fontSize:13,color:Colors.blue),),
                                      InkWell(
                                        child:Text("S'inscrire",textAlign: TextAlign.center,style: TextStyle(fontSize:13,color:Colors.blue,fontWeight: FontWeight.bold,),),
                                        onTap: ()
                                        {
                                          Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => const AddUserView(),
                                          ));
                                        },
                                      ),
    
                              ]),
                              ],
                        ),
                    ),
             ),
        );
  }
}