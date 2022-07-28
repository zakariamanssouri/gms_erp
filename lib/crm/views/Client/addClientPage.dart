import 'package:flutter/material.dart';
import '../../../config/global_params.dart';
import '../../../widgets/ButtonWidget.dart';
import '../../../widgets/TextFieldWiget.dart';
import '../../models/Client.dart';

class AddClientPage extends StatelessWidget {
  Client client = Client(id: '', name: '', no: '', country: '', city: '', street: '', type: '',
  group: '', phone: '');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: GlobalParams.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[200],
          elevation: 0,
          title: Text(
            "Ajouter Client",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 19,
                fontFamily: 'Open Sans'),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
              bottom: GlobalParams.MainPadding,
              right: GlobalParams.MainPadding,
              left: GlobalParams.MainPadding),
          width: double.infinity,
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: size.height * 0.02),
              // Form for editing qunaity and price
              Builder(builder: (context) {
                return DataField(client: client,);
              }),

              SizedBox(height: size.height * 0.02),
            ],
          ),
        ));
  }
}


class DataField extends StatefulWidget {
  final Client client;
  DataField({Key? key, required this.client})
      : super(key: key);

  @override
  State<DataField> createState() =>
      DataFieldState(client);
}

class DataFieldState extends State<DataField> {
  final Client client;
  TextEditingController numController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController telController = TextEditingController();
  
  List<String> typeList = ['Marocain', 'Agence de voyage', 'Société privé',
        'Etranger', 'Administration publique', 'Super Marché', 'HOTEL', 'RESTAURANT'];
  List<String> grpList = ['Divers', 'Moyen client', 'Grand client', 'Grossiste'];
  List<String> stateList = ['Qualifier', 
        'Disqualifié - Perdu', 
        'Disqualifié - Impossible de contacter', 
        'Disqualifié - n\' est plus interessé', 
        'Disqualifié - Annule', 
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

  DataFieldState(this.client) {
    numController.text = client.no.toString();
    nameController.text = client.name.toString();
    telController.text = client.phone.toString();
  }

  String? validateNumber(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    } else {
      String pattern = r'[0-9]\.[0-9]';
      RegExp regex = new RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Entrer Un Nombre Valide';
      }
    }
  }

  String? validateField(String value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                  valuetext: '',
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
                  valuetext: '',),
              SizedBox(height: size.height * 0.02),

              
              TextFieldWidget(
                  controller: telController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  validator: (value) {
                    return validateNumber(value!);
                  },
                  obj: client, valuetext: '', labeltext: 'Telephone',),
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
                text: 'Ajouter',
                size: size,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    //
                  }
                }
                    )])));
  }
}