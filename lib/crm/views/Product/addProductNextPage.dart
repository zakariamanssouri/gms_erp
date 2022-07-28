import 'package:flutter/material.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/services/ProductService.dart';
import 'package:gms_erp/crm/views/Product/productItem.dart';

import '../../../widgets/ButtonWidget.dart';
import '../../../widgets/TextFieldWiget.dart';
import '../../models/Product.dart';


class AddProductNextPage extends StatelessWidget {

  String num, name, code, purPrice, salesPrice, stock;
  AddProductNextPage({Key? key, required this.num, required this.name, required this.code, 
  required this.purPrice, required this.salesPrice, required this.stock})
      : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Product product = Product(id: '', no: num, name: name, s_price: salesPrice, stock_min: stock, code: code, s_price_min: '');
    product.p_price = purPrice;
    
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: GlobalParams.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[200],
          elevation: 0,
          title: Text(
            'Ajouter Produit',
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
                return ProductDataField(product: product);
              }),

              SizedBox(height: size.height * 0.02),
            ],
          ),
        ));
  }
}


class ProductDataField extends StatefulWidget {
  final Product product;
  ProductDataField({Key? key, required this.product})
      : super(key: key);

  @override
  State<ProductDataField> createState() =>
      ProductDataFieldState(product);
}

class ProductDataFieldState extends State<ProductDataField> {
  Product product;
  
  List<String> measureList = ['Carton',
        'Gramme',
        'Heure',
        'Jour',
        'Metre',
        'Litre',
        'Bouteille',
        'Tonne',
        'Paquets',
        'Pièce',
        'Milligramme',
        'Kg',
        'Abat',
        'Service',
        'UNT'];
  List<String> packtypeList = ['SOUS VIDE',
        'CARCASSE',
        'VRAC'];
  List<String> grpList = ['Viande Rouge',
        'Ovins',
        'Bovins',
        'Caprin',
        'Volaille',
        'Produit hygiene',
        'Produit Nettoyage',
        'Epices ',
        'Emballage',
        'Legume frais Decouper',
        'produits laitier',
        'Service',
        'FOURNITURE BUREAU',
        'PRODUITS D\'ENTRETIEN',
        'COUTELLERIE',
        'CAISSES PLASTIQUE',
        'VETEMENTS PRO',
        'BOYAUX',
        'ATTACHES D\'ETIQUETTES',
        'PISTOLET',
        'AIGUILLES',
        'COEUR',
        'CHARCUTERIE'];
  List<String> typeList = ['AIGUILLES PISTOLETS',
        'ATTACHES ETIQUETTES',
        'Agneau',
        'Boeuf',
        'Chevre',
        'Emballage',
        'Genisse',
        'Vache',
        'Veau',
        'BOYAUX',
        'CAISSES PLASTIQUE',
        'Chevreau',
        'COUTELLERIE',
        'Dinde',
        'Epice Marinade',
        'FOURNITURE BUREAU',
        'Agnelle',
        'PISTOLET ',
        'Produit hygiene',];
  List<String> stateList = ['Actif',
        'Non valide',
        'Bloqué',
        'Inactif',];
  List<String> vatList = ['14 %',
        '20 %',
        '0 %',
        '10 %'];

  String selectedMeasure = 'Carton';
  String selectedPacktype = 'SOUS VIDE';
  String selectedType = 'Marocain';
  String selectedGroup = 'Divers';
  String selectedState = 'Qualifier';
  String selectedVat = '14 %';

  final _formKey = GlobalKey<FormState>();
  double _fontsize = 15;

  ProductDataFieldState(this.product) {
    
  }

  
  int MeasureID(String measure){
        switch(measure){
            case 'Carton' :
                return 2;
            case 'Gramme' :
                return 3;
            case 'Heure' :
                return 5;
            case 'Jour' :
                return 6;
            case 'Metre' :
                return 7;
            case 'Litre' :
                return 8;
            case 'Bouteille' :
                return 11;
            case 'Tonne' :
                return 13;
            case 'Paquets' :
                return 14;
            case 'Pièce' :
                return 15;
            case 'Milligramme' :
                return 1002;
            case 'Kg' :
                return 1003;
            case 'Abat' :
                return 1004;
            case 'Service' :
                return 1005;
            case 'UNT' :
                return 1006;
            default:
                return 0;
        }
    }
    int TypeID(String type){
        switch(type){
            case 'AIGUILLES PISTOLETS' :
                return 1;
            case 'ATTACHES ETIQUETTES' :
                return 2;
            case 'Agneau' :
                return 3;
            case 'Boeuf' :
                return 4;
            case 'Chevre' :
                return 5;
            case 'Emballage' :
                return 6;
            case 'Genisse' :
                return 7;
            case 'Vache' :
                return 8;
            case 'Veau' :
                return 9;
            case 'BOYAUX' :
                return 10;
            case 'CAISSES PLASTIQUE' :
                return 11;
            case 'Chevreau' :
                return 13;
            case 'COUTELLERIE' :
                return 14;
            case 'Dinde' :
                return 15;
            case 'Epice Marinade' :
                return 17;
            case 'FOURNITURE BUREAU' :
                return 8;
            case 'Agnelle' :
                return 21;
            case 'PISTOLET ' :
                return 24;
            case 'Produit hygiene' :
                return 25;
            default:
                return 0;
        }
    }
    int PacktypeID(String packtype){
        switch (packtype){
            case 'SOUS VIDE':
                return 1;
            case 'CARCASSE':
                return 2;
            case 'VRAC':
                return 3;
            default:
                return 0;
        }
    }
    int GrpID(String grp){
        switch (grp){
            case 'Viande Rouge':
                return 4;
            case 'Ovins':
                return 1023;
            case 'Bovins':
                return 1025;
            case 'Caprin':
                return 1027;
            case 'Volaille':
                return 1028;
            case 'Produit hygiene':
                return 1029;
            case 'Produit Nettoyage':
                return 1030;
            case 'Epices ':
                return 1031;
            case 'Emballage':
                return 1032;
            case 'Legume frais Decouper':
                return 1033;
            case 'produits laitier':
                return 1034;
            case 'Service':
                return 1035;
            case 'FOURNITURE BUREAU':
                return 1037;
            case 'PRODUITS D\'ENTRETIEN':
                return 1038;
            case 'COUTELLERIE':
                return 1039;
            case 'CAISSES PLASTIQUE':
                return 1040;
            case 'VETEMENTS PRO':
                return 1042;
            case 'BOYAUX':
                return 1043;
            case 'ATTACHES D\'ETIQUETTES':
                return 1044;
            case 'PISTOLET':
                return 1045;
            case 'AIGUILLES ':
                return 1046;
            case 'COEUR':
                return 1047;
            case 'CHARCUTERIE':
                return 1048;
            default:
                return 0;
        }
    }
    int StateID(String state){
        switch (state){
            case 'Actif':
                return 1;
            case 'Non validé':
                return 2;
            case 'Bloqué':
                return 3;
            case 'Inactif':
                return 4;
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

                  Container(
                            //padding: EdgeInsets.only(top: 8),
                            child: Column(
                              children: [
                                Form(
                                  child: InputDecorator(
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      labelText: 'Mesure',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey),
                                      border: const OutlineInputBorder(),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: selectedMeasure,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedMeasure= newValue.toString();
                                            product.measure = selectedType;
                                            product.measure_id = MeasureID(selectedType).toString();
                                          });
                                        },
                                        //decoration: InputDecoration(border: InputBorder.none),
                                        items: measureList
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
                                      labelText: 'Packtype',
                                      labelStyle: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey),
                                      border: const OutlineInputBorder(),
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        isDense: true,
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        value: selectedPacktype,
                                        onChanged: (newValue) {
                                          setState(() {
                                            selectedPacktype = newValue.toString();
                                            product.packtype = selectedPacktype;
                                            product.packtype_id = PacktypeID(selectedPacktype).toString();
                                          });
                                        },
                                        //decoration: InputDecoration(border: InputBorder.none),
                                        items: packtypeList
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
                                            product.type = selectedType;
                                            product.type_id = StateID(selectedType).toString();
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
                                            product.group = selectedGroup;
                                            product.grp_id = StateID(selectedGroup).toString();
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
                                            product.state = selectedState;
                                            product.state_id = StateID(selectedState).toString();
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
                                            product.vat = selectedVat;
                                            product.vat_id = VatID(selectedVat).toString();
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
                    ProductService.addProduct(product);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      padding: EdgeInsets.all(20),
                      content: Text('Produit Ajouté')));
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProductItem(product: product)));
                  //}
                }
                    )])));
  }
}