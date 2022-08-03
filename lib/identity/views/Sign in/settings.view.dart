import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import '../../../service.base.dart';

class SettingsView extends StatefulWidget
{
  const SettingsView({Key? key}) : super(key: key);
  @override
  State<SettingsView> createState() => _SettingsView();
}

class _SettingsView extends State<SettingsView>
 {
  String domainName="";
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController domainNameController = TextEditingController();
  final String domainNameMessage=' Saisir le nom du domaine avant de continuer';
  var items ;
 
  @override
   void initState()  {
    BaseService.GET_DOMAINS().then((value) => items=value);
    super.initState();
     BaseService.GET_DOMAINS().then((value) => {
      if(value.isNotEmpty)
       domainNameController.text = value.last,
     });
  }



  @override
  Widget build(BuildContext context) 
  {

    return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white, iconTheme: const IconThemeData(color: Colors.blue),elevation: 0,),
          backgroundColor: Colors.white,
          body: Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                      key: formKey,
                      child: ListView(
                            children:[
                             const SizedBox(height:35),
                             Container(
                              decoration: const BoxDecoration(borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30),), ),
                              child:CircleAvatar(
                                   radius: 80.0,
                                   child: ClipRRect(
                                       borderRadius: BorderRadius.circular(10.0),
                                       child: Image.asset('assets/images/logo.png'),), ),),
                                const SizedBox(height:10),
                                Text(domainNameMessage,textAlign: TextAlign.center,style: const TextStyle(color: Colors.blue,fontSize:13,),),
                                const SizedBox(height:20),
                                TextFormField(
                                     autovalidateMode: AutovalidateMode.onUserInteraction,
                                     controller: domainNameController,
                                      decoration: InputDecoration(
                                      prefixIcon: const Icon(Icons.domain,color:Color(0xff00A3EE)),
                                      hintText: 'Domaine',
                                      // labelText: 'Domaine',
                                      suffixIcon: PopupMenuButton<String>(
                                          icon: const Icon(Icons.arrow_drop_down),
                                          onSelected: (String value) {
                                            domainNameController.text = value;
                                          },
                                          itemBuilder: (BuildContext context)=><PopupMenuItem<String>>[
                                            for( var item in items)  
                                               PopupMenuItem(
                                                  value: item,
                                                  child: Text('$item')),
                                          ],),     
                                        ),
                                      ),
                                const SizedBox(height:15),
                                ElevatedButton(
                                onPressed: () async {
                                  if (formKey.currentState!.validate())
                                  {
                                    BaseService.ADD_DOMAIN(domainNameController.text);
                                  }
                               },
                                  style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(240, 40), 
                                  primary: Colors.blue),
                                  child: const Text('Enregistrer'),
                              ), 
                            ],
                      ),
                  ),
           ),
      ); 
  }
}