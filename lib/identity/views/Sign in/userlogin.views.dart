// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';

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
          body: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                  key: _formKey,
                  child: ListView(
                        children:[
                            SizedBox(height:10),
                            TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                            hintText: 'email',
                            labelText: 'email',
                            prefixIcon: Icon(Icons.email,color: Color(0xff00A3EE),),),
                            validator: MultiValidator([RequiredValidator(errorText: 'requied'),EmailValidator(errorText: 'Email invalid')]),
                            ),
                            SizedBox(height:10),
                            SizedBox(height:10),
                            TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            obscureText:true,
                            decoration: const InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                            hintText: 'password',
                            labelText: 'password',
                            prefixIcon: Icon(Icons.lock,color: Color(0xff00A3EE),),),
                            validator: MultiValidator([RequiredValidator(errorText: 'requied'),]),
                            ),
                            SizedBox(height:10),
                            ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()){
                              print('hh');
                              }},
                            child: const Text('Submit'),
                          ),
                        ],
                  ),
              ),
          ),            
    );
  }
}