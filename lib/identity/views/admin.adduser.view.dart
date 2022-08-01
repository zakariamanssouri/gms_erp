import 'package:flutter/material.dart';
import 'package:gms_erp/identity/services/user.service.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:gms_erp/widgets/ButtonWidget.dart';



class AddUserAdminView extends StatefulWidget 
{
  const AddUserAdminView({Key? key}) : super(key: key);
  @override
  State<AddUserAdminView> createState() => _AddUserAdminView();
}

class _AddUserAdminView extends State<AddUserAdminView>
{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserService userService = UserService();
  bool isChecked = false;
  @override
  Widget build(BuildContext context) 
  {
  Size size = MediaQuery.of(context).size;

    return Scaffold(
       appBar: AppBar(
            backgroundColor: Colors.white, iconTheme: const IconThemeData(color: Colors.blue),title: const Text("Ajouter Utilisateurs",style: TextStyle(color:Colors.blue),),elevation: 0,),
            backgroundColor: Colors.white,
            body: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Form(
                        key: _formKey,
                        child: ListView(
                              children:[
                                 const SizedBox(height:5),
                                  TextFormField(
                                  controller: nameController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'CIN',
                                  labelText: 'CIN',
                                  prefixIcon: Icon(Icons.security,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire')]),
                                  ),
                                  const SizedBox(height:20),
                                  TextFormField(
                                  controller: nameController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Nom Complet',
                                  labelText: 'Nom Complet',
                                  prefixIcon: Icon(Icons.person,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([PatternValidator(r"^[A-Za-zÀ-ÖØ-öø-ÿ_.-\s]+$", errorText: 'Le nom ne doit pas contenir des chiffres.')]),
                                  ),
                                  const SizedBox(height:20),
                                  TextFormField(
                                  controller:emailController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Role',
                                  labelText: 'Role',
                                  prefixIcon: Icon(Icons.person_pin,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire')]),
                                  ),
                                  const SizedBox(height:20),
                                  TextFormField(
                                  controller:emailController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Salaire',
                                  labelText: 'Salaire',
                                  prefixIcon: Icon(Icons.money_sharp,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire')]),
                                  ),
                                  const SizedBox(height:20),
                                  TextFormField(
                                  controller:emailController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Adresse Email',
                                  labelText: 'Adresse Email',
                                  prefixIcon: Icon(Icons.email,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire'),EmailValidator(errorText: 'Email est invalide')]),
                                  ),
                                  const SizedBox(height:20),
                                  TextFormField(
                                  controller: passwordController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  obscureText:true,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Mot de passe',
                                  labelText: 'Mot de passe',
                                  prefixIcon: Icon(Icons.lock,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire'),]),
                                  ),
                                  const SizedBox(height:25),
                                  ButtonWidget(size: size, onPressed: (){}, text: "Enregistrer"),
                              ],
                        ),
                    ),
             ),
        );
  }
}