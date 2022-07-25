// ignore_for_file: avoid_unnecessary_containers, avoid_print, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../../config/menu.dart';
import '../../../widgets/homebutton.dart';

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
  Widget build(BuildContext context) 
  {
    return Scaffold(
          // ignore: prefer_const_constructors
          body: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Form(
                      key: _formKey,
                      child: ListView(
                            children:[
                             Container(
                              decoration: BoxDecoration(borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),), ),
                              child:CircleAvatar(
                                   radius: 80.0,
                                   child: ClipRRect(
                                       child: Image.asset('images/logo.png'),
                                       borderRadius: BorderRadius.circular(10.0),), ),),
                                //   Text('Se Connecter',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize: 35,fontWeight: FontWeight.w400,),),
                                const SizedBox(height:10),
                                Text(' Se connecter avant de commencer ',textAlign: TextAlign.center,style: TextStyle(color: Colors.blue,fontSize:13,),),
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
                                     print('object');
                                  }},
                                  style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(240, 40), 
                                  primary: Colors.blue), 
                                  
                                child: const Text('Se Connecter'),
                              ),
                              const SizedBox(height:10),
                            // Text("Si vous n'avez pas de compte merci de S'inscrire",textAlign: TextAlign.center,style: TextStyle(fontSize:13,),),

                            ],
                      ),
                  ),
           ),);
     
  }
}