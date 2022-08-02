import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/crm/views/Client/clientItem.dart';
import '../../../blocs/Client/client_bloc.dart';
import '../../../config/global_params.dart';
import '../../../inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import '../../../widgets/ButtonWidget.dart';
import '../../../widgets/TextFieldWiget.dart';
import '../../models/Client.dart';

class AddClientPage extends StatelessWidget {
  Client? client;
  AddClientPage({
    Key? key,
    this.client,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(this.client == null)
      this.client = Client(id: '', name: '', no: '', country: '', city: '', street: '', type: '',
      group: '', phone: '');
    return AddingWidget(client: client!);
  }
}

class AddingWidget extends StatelessWidget {

  bool? update;
  final Client client;

  AddingWidget({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;

    if(client.id != '')
      update = true;
    else
      update = false;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: GlobalParams.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[200],
          elevation: 0,
          title: update! ? Text(
            "Client  " + client.no,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 19,
                fontFamily: 'Open Sans'),
          ) : const Text(
            "Ajouter Client",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 19,
                fontFamily: 'Open Sans'),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                bottom: GlobalParams.MainPadding,
                right: GlobalParams.MainPadding,
                left: GlobalParams.MainPadding),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: 
                  BlocListener<ClientBloc, ClientState>(
                  listener: (context, state) {
                    print("request state:${state.requestState}");
                    

                    
              
              // data is loading
              if (state.requestState == RequestState.Adding ||
                  state.requestState == RequestState.Loading || 
                  state.requestState == RequestState.Updating)
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              // data is loading
              // data is loaded
              else if (state.requestState == RequestState.Added) {
                print('Add successful');
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  text: 'Le client a été ajouté avec succès',
                );
                BlocProvider.of<ClientBloc>(context).add(
                    LoadClients());
                    
                              Navigator.pop(context);
                  }
                  else if (state.requestState == RequestState.Updated) {
                print('Update successful');
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.success,
                  text: 'Le client a été mis à jour avec succès',
                );
                BlocProvider.of<ClientBloc>(context).add(
                    LoadClients());
                    
                              Navigator.pop(context);
                  }
              // Error
              if (state.requestState == RequestState.Error){
                BlocProvider.of<ClientBloc>(context).add(
                    LoadClients());
              ErrorWithRefreshButtonWidget(
                inventory: null,
                button_function: () {
                  DataField(client: client, isUpdate: update!);
                },
              );
                    }
                   }, // Error
                   child: DataField(client: client, isUpdate: update!)
            ),
          )]),
          )
          ),
        );
  }
}


class DataField extends StatefulWidget {
  final Client client;
  final bool isUpdate;
  DataField({Key? key, required this.client, required this.isUpdate})
      : super(key: key);

  @override
  State<DataField> createState() =>
      DataFieldState(client, isUpdate);
}

class DataFieldState extends State<DataField> {
  Client client;
  bool isUpdate;
  TextEditingController numController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  
  List<String> typeList = ['Marocain', 'Agence de voyage', 'Société privé',
        'Etranger', 'Administration publique', 'Super Marché', 'HOTEL', 'RESTAURANT'];
  List<String> grpList = ['Divers', 'Moyen client', 'Grand client', 'Grossiste'];
  List<String> stateList = ['Qualifier', 
        'Disqualifié - Perdu', 
        'Disqualifié - Impossible de contacter', 
        'Disqualifié - n\'est plus interessé', 
        'Disqualifié - Annulé', 
        'Nouveau'];
  List<String> vatList = ['14 %',
        '20 %',
        '0 %',
        '10 %'];

  String selectedType = 'Marocain';
  String selectedGroup = 'Divers';
  String selectedState = 'Qualifier';
  String selectedVat = '14 %';
  

  final _formKey = GlobalKey<FormState>();
  double _fontsize = 15;

  DataFieldState(this.client, this.isUpdate) {
    numController.text = client.no.toString();
    nameController.text = client.name.toString();
    telController.text = client.phone.toString();
    if(isUpdate){
      selectedType = client.type;
      if(client.type.contains('tranger'))
        selectedType = 'Etranger';
      selectedGroup = client.group;
      selectedState = State(client.state_id == null || client.state_id == 'null' ? '1' : client.state_id!);
      selectedVat = Vat(client.vat_id == null || client.vat_id == 'null' ? '1' : client.vat_id!);
    }
  }

  int TypeID(String type){
        switch(type){
            case 'Marocain' :
                return 2;
            case 'Agence de voyage' :
                return 4;
            case 'Société privé' :
                return 7;
            case 'Etranger' :
                return 8;
            case 'Administration publique' :
                return 10;
            case 'Super Marché' :
                return 1002;
            case 'HOTEL' :
                return 1003;
            case 'RESTAURANT' :
                return 1004;
            default:
                return 0;
        }
    }

    int GrpID(String grp){
        switch(grp){
            case 'Divers' :
                return 8;
            case 'Moyen client' :
                return 14;
            case 'Grand client' :
                return 15;
            case 'Grossiste' :
                return 1008;
            default:
                return 0;
        }
    }

    int StateID(String state){
        switch(state){
            case 'Qualifier' :
                return 1;
            case 'Disqualifié - Perdu' :
                return 2;
            case 'Disqualifié - Impossible de contacter' :
                return 3;
            case 'Disqualifié - n\'est plus interesse' :
                return 4;
            case 'Disqualifié - Annulé' :
                return 5;
            case 'Nouveau' :
                return 6;
            default:
                return 0;
        }
    }
    int VatID(String vat){
        switch(vat){
            case '14 %':
                return 1;
            case '20 %':
                return 2;
            case '0 %':
                return 3;
            case '10 %':
                return 4;
            default:
                return 0;
        }
    }



    String State(String id){
        switch(id){
            case '1' :
                return 'Qualifier';
            case '2' :
                return 'Disqualifié - Perdu';
            case '3' :
                return 'Disqualifié - Impossible de contacter';
            case '4' :
                return 'Disqualifié - n\'est plus interesse';
            case '5' :
                return 'Disqualifié - Annulé';
            case '6' :
                return 'Nouveau';
            default:
                return 'Qualifier';
        }
    }
    String Vat(String id){
        switch(id){
            case '1':
                return '14 %';
            case '2':
                return '20 %';
            case '3':
                return '0 %';
            case '4':
                return '10 %';
            default:
                return '14 %';
        }
    }




  String? validateNumber(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez remplir le champs';
    } else {
      RegExp regex = new RegExp(r'^[0-9]+$');
      if (!regex.hasMatch(value)) {
        return 'Entrer Un Nombre Valide';
      }
    }
  }

  String? validateField(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez remplir le champs';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    client.type = selectedType;
    client.group = selectedGroup;
    client.etat = selectedState;
    client.vat = selectedVat;
    client.type_id = TypeID(selectedType).toString();
    client.grp_id = GrpID(selectedGroup).toString();
    client.state_id = StateID(selectedState).toString();
    client.vat_id = VatID(selectedVat).toString();

    return Center(
      child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.02),
              TextFieldWidget(
                  validator: (value) {
                    return validateNumber(value!);
                  },
                  obj: client,
                  controller: numController,
                  labeltext: 'Numero',
                  valuetext: client.no,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),),
      
              SizedBox(height: size.height * 0.02),
              TextFieldWidget(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  validator: (value) {
                    return validateField(value!);
                  },
                  obj: client,
                  labeltext: 'Nom',
                  valuetext: client.name),
              SizedBox(height: size.height * 0.02),
      
              
              TextFieldWidget(
                  controller: telController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  validator: (value) {
                    return validateNumber(value!);
                  },
                  obj: client, valuetext: client.phone, labeltext: 'Telephone',),
              SizedBox(height: size.height * 0.02),
      
                  Container(
                            //padding: EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Form(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      labelText: 'Type',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey),
                                      border: const OutlineInputBorder(),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: selectedType,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedType = newValue.toString();
                                            client.type = selectedType;
                                            client.type_id = TypeID(selectedType).toString();
                                          });
                                        },
                                        //decoration: InputDecoration(border: InputBorder.none),
                                        items: typeList
                                            .map<DropdownMenuItem<String>>((items) {
                                          return DropdownMenuItem<String>(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 7),
                                                  child: Text(items),
                                                ),
                                              ],
                                            ),
                                            value: items,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                )])
                                ),
              SizedBox(height: size.height * 0.02),
      
              Container(
                            //padding: EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Form(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      labelText: 'Groupe',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey),
                                      border: const OutlineInputBorder(),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: selectedGroup,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedGroup = newValue.toString();
                                            client.group = selectedGroup;
                                            client.grp_id = GrpID(selectedGroup).toString();
                                          });
                                        },
                                        //decoration: InputDecoration(border: InputBorder.none),
                                        items: grpList
                                            .map<DropdownMenuItem<String>>((items) {
                                          return DropdownMenuItem<String>(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 7),
                                                  child: Text(items),
                                                ),
                                              ],
                                            ),
                                            value: items,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                )])
                                ),
              SizedBox(height: size.height * 0.02),
      
              Container(
                            //padding: EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Form(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      labelText: 'Etat',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey),
                                      border: const OutlineInputBorder(),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: selectedState,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedState = newValue.toString();
                                            client.etat = selectedState;
                                            client.state_id = StateID(selectedState).toString();
                                          });
                                        },
                                        //decoration: InputDecoration(border: InputBorder.none),
                                        items: stateList
                                            .map<DropdownMenuItem<String>>((items) {
                                          return DropdownMenuItem<String>(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 7),
                                                  child: Text(items),
                                                ),
                                              ],
                                            ),
                                            value: items,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                )])
                                ),
              SizedBox(height: size.height * 0.02),
      
              Container(
                            //padding: EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Form(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      labelText: 'VAT',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey),
                                      border: const OutlineInputBorder(),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: selectedVat,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedVat = newValue.toString();
                                            client.vat = selectedVat;
                                            client.vat_id = VatID(selectedVat).toString();
                                          });
                                        },
                                        items: vatList
                                            .map<DropdownMenuItem<String>>((items) {
                                          return DropdownMenuItem<String>(
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      EdgeInsets.only(top: 7),
                                                  child: Text(items),
                                                ),
                                              ],
                                            ),
                                            value: items,
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ),
                                )])
                                ),
              SizedBox(height: size.height * 0.04),
      
              ButtonWidget(
                text: 'Envoyer',
                size: size,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    client.name = nameController.text;
                    client.no = numController.text;
                    client.phone = telController.text;
                    //print(ClientService.addClient(client) is Client);
                    isUpdate ? BlocProvider.of<ClientBloc>(context).add(
                    UpdateClientEvent(client: client)) :  BlocProvider.of<ClientBloc>(context).add(
                    AddClientEvent(
                        client: client,));
                      
                                  
                    
                    /*if(ClientService.addClient(client) is Client){
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        padding: EdgeInsets.all(20),
                        content: Text("Client Ajouté")));
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => ClientItem(client: client)));
                    }
                    else{}*/
                }
                }
                    )
                    ])));
  }
}