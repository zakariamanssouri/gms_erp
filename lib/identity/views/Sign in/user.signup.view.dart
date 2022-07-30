import 'package:flutter/material.dart';
import 'package:gms_erp/identity/services/user.service.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'user_login.view.dart';


class AddUserView extends StatefulWidget 
{
  const AddUserView({Key? key}) : super(key: key);
  @override
  State<AddUserView> createState() => _AddUserView();
}

class _AddUserView extends State<AddUserView>
{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Form(
                        key: _formKey,
                        child: ListView(
                              children:[
                                Container(
                                decoration: const BoxDecoration(borderRadius:  BorderRadius.only(
                                bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),), ),
                                child:CircleAvatar(
                                     radius: 80.0,
                                     child: ClipRRect(
                                         borderRadius: BorderRadius.circular(10.0),
                                         child: Image.asset('assets/images/logo.png'),), ),),
                                  const SizedBox(height:25),
                                  TextFormField(
                                  controller: nameController,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  decoration: const InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10),),),
                                  hintText: 'Nom Complet',
                                  labelText: 'Nom Complet',
                                  prefixIcon: Icon(Icons.person,color: Color(0xff00A3EE),),),
                                  validator: MultiValidator([PatternValidator(r"^[A-Za-zÀ-ÖØ-öø-ÿ_.-\s]+$", errorText: 'Votre nom ne doit pas contenir des chiffres.')]),
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
                                  validator: MultiValidator([RequiredValidator(errorText: 'Champs Obligatoire'),EmailValidator(errorText: 'Votre email est invalide')]),
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
                                  const SizedBox(height:15),
                                  ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate())
                                    {
                                      // var p=new User(
                                      //     name: nameController.text,
                                      //     email: emailController.text ,
                                      //     password:passwordController.text);
                                      // await userService.create(p).then((value) => MyAlert.showAlertDialog(context,"title","content"),);
                                      //   // if(response)
                                        // {
                                        //   Navigator.popAndPushNamed(context, 'product');
                                        // }
                                        // else                  
                                        // {
                                        //   throw Exception('Failed to create product.');
                                        // }
                                    }
                                  },
                                    style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(240, 40), 
                                    primary: Colors.blue),
                                  child: const Text("S'inscrire"),),
                                const SizedBox(height:20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      const Text("Si vous avez  de compte",textAlign: TextAlign.center,style: TextStyle(fontSize:13,color:Colors.blue),),
                                      InkWell(
                                      child:const Text(" Se Connecter",textAlign: TextAlign.center,style: TextStyle(fontSize:13,color:Colors.blue,fontWeight: FontWeight.bold,),),
                                      onTap: ()
                                      {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                        builder: (context) => const UserLogin(),
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