import 'package:flutter/material.dart';
import 'package:gms_erp/identity/services/user.service.dart';
import 'package:gms_erp/identity/views/Sign%20in/settings.view.dart';
import 'package:gms_erp/service.base.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../homepage.dart';
import 'user.signup.view.dart';

class UserLogin extends StatefulWidget 
{
  const UserLogin({Key? key}) : super(key: key);
  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin>
 {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final CheckController = TextEditingController();
  UserService userService =UserService();
  bool isChecked = false;
  @override
   void initState() 
   { 
    super.initState();
    BaseService.GET_DOMAIN();
   }


  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
            backgroundColor: Colors.white,
            body: Padding(
                    padding: const EdgeInsets.all(35.0),
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
                                            builder: (context) => SettingsView(),
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
                                  const SizedBox(height:25),
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
                                  const SizedBox(height:15),
                                 Row(
                                 children:[
                                   Checkbox(
                                    checkColor: Colors.white,
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        if(!isChecked) {
                                            isChecked=true;
                                        }
                                        else{
                                            isChecked=false;
                                        }
                                      });
                                    }),
                                    const Text("Me seuvenir? ",textAlign: TextAlign.center,style: TextStyle(fontSize:13,)),
                                    ]),
                                    const SizedBox(height:15),
                                  ElevatedButton(
                                  
                                  child: const Text('Se Connecter'),
                                  onPressed: () async
                                  {
                                    if (_formKey.currentState!.validate())
                                    {
                                      //  var U =new User(
                                      //  email:  emailController.text,
                                      //  password: passwordController.text);
                                      //  await userService.Login(U).then((value) => _saveToken(value));
                                       Navigator.push(context,MaterialPageRoute(builder: (context) => const HomePage(),));
                                      //  var token = await BaseService.READTOKEN();
                                      //  print('token $token');
                                    }
                                  } ,
                                    style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(240, 40), 
                                    primary: Colors.blue), 
                                ),
                                const SizedBox(height:20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                    children:[
                                      const Text("Si vous n'avez pas de compte",textAlign: TextAlign.center,style: TextStyle(fontSize:13,color:Colors.blue),),
                                      InkWell(
                                      child:const Text(" S'inscrire",textAlign: TextAlign.center,style: TextStyle(fontSize:13,color:Colors.blue,fontWeight: FontWeight.bold,),),
                                      onTap: ()
                                      {
                                        Navigator.push(
                                        context,
                                        MaterialPageRoute(  builder: (context) => const AddUserView(),  ));
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