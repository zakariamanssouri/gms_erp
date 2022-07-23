// ignore_for_file: unused_import, unnecessary_new, use_build_context_synchronously, non_constant_identifier_names, prefer_final_fields, prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gms_erp/identity/myalert.dart'; 
import '../models/user.dart';
import '../services/user.service.dart'; 


class AddUserView extends StatefulWidget
 {
  const AddUserView({Key? key}) : super(key: key);
  @override
   _HomePageState createState() => _HomePageState();
 }

class _HomePageState extends State<AddUserView> 
 {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserService userservice = UserService();

  GlobalKey<FormState> _FormKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) 
  {
      return Scaffold(
      appBar: AppBar(title: const Text('Add User'),),
      body:Container(padding: const EdgeInsets.all(20),
      child:Form(
      key: _FormKey,
      child: Column(children:[
              Text('My Card Alert',style: TextStyle( height: 2,fontSize: 30)),
              SizedBox(height:30),
              TextFormField(
                        controller: nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                        hintText: 'name',
                        labelText: 'name',
                        prefixIcon: Icon(Icons.person),),
                        validator: MultiValidator([RequiredValidator(errorText: 'requied'),]),),
              const SizedBox(height: 10,),
              TextFormField(
                        controller: emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                        hintText: 'email',
                        labelText: 'email',
                        prefixIcon: Icon(Icons.email),),
                        validator: MultiValidator([RequiredValidator(errorText: 'requied'),EmailValidator(errorText: 'Email invalid')]),),
              SizedBox(height:10),
              TextFormField(
                        controller: passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        decoration: const InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                        hintText: 'password',
                        labelText: 'password',
                        prefixIcon: Icon(Icons.password),),
                        validator: MultiValidator([RequiredValidator(errorText: 'requied'),]), ),
              SizedBox(height:10),
              ElevatedButton(
            onPressed: () async 
            {
               if( _FormKey.currentState!.validate())
               {                print('hello');
                var p=new User(
                 name:  nameController.text,
                 email:   emailController.text ,
                 password: passwordController.text);

                 var response=await userservice.create(p).then((value) => MyAlert.showAlertDialog(context,"title","content"),);
                  if(response)
                  {
                    Navigator.popAndPushNamed(context, 'product');
                  }
                  else                  
                  {
                    throw Exception('Failed to create product.');
                  }
               }
            },
            child: const Text('Registration')
               )
            ])
          ),
        )
      );
  }
 }
















