import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Product/productItem.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';
import 'package:gms_erp/shared/services/ProductService.dart';

import '../../../widgets/ButtonWidget.dart';
import '../../../widgets/TextFieldWiget.dart';
import '../../models/Product.dart';


class AddProductNextPage extends StatelessWidget {
  String? num, name, code, purPrice, salesPrice, stock;
  Product? product;
  AddProductNextPage({Key? key, this.num, this.name, this.code, 
  this.purPrice, this.salesPrice, this.stock, this.product})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if(this.product == null){
      Product product = Product(id: '', no: num!, name: name!, s_price: salesPrice!, stock_min: stock!, code: code!, s_price_min: '0.00');
      product.p_price = purPrice;
    }
    return AddingWidget(product: product!);
  }
}

class AddingWidget extends StatelessWidget {

  bool? update;
  AddingWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    if(product.id != '')
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
          title: update! ? const Text(
            "Modifier Produit",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 19,
                fontFamily: 'Open Sans'),
          ) : const Text(
            "Ajouter Produit",
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
                  BlocListener<ProductBloc, ProductState>(
                  listener: (context, state) {
                    print("request state:${state.requestState}");
                    

                    
              
              // data is loading
              if (state.requestState == ProductRequestState.Adding ||
                  state.requestState == ProductRequestState.Loading ||
                  state.requestState == ProductRequestState.Updating)
                Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );

              // data is loading
              // data is loaded
              else if (state.requestState == ProductRequestState.Added) {
                print('Add successful');
                BlocProvider.of<ProductBloc>(context).add(
                    LoadAllProductsEvent());
                    
                              Navigator.push(_context,
                                  MaterialPageRoute(builder: (context) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<ProductBloc>(
                                      _context),
                                      child: ProductItem(
                                    product: product,
                                  ),);}));
                  }
                  else if (state.requestState == ProductRequestState.Updated) {
                print('Update successful');
                BlocProvider.of<ProductBloc>(context).add(
                    LoadAllProductsEvent());
                    
                              Navigator.push(_context,
                                  MaterialPageRoute(builder: (context) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<ProductBloc>(
                                      _context),
                                      child: ProductItem(
                                    product: product,
                                  ),);}));
                  }
              // Error
              if (state.requestState == ProductRequestState.Error){
              ErrorWithRefreshButtonWidget(
                inventory: null,
                button_function: () {
                  ProductDataField(product: product, isUpdate: update!);
                },
              );
                    }
                   },child: ProductDataField(product: product, isUpdate: update!), // Error
            ),
          )]),
          )
          ),
        );
  }
}


class ProductDataField extends StatefulWidget {
  final Product product;
  bool isUpdate;
  ProductDataField({Key? key, required this.product, required this.isUpdate})
      : super(key: key);

  @override
  State<ProductDataField> createState() =>
      ProductDataFieldState(product, isUpdate);
}

class ProductDataFieldState extends State<ProductDataField> {
  Product product;
  bool isUpdate;
  
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
  String selectedType = 'AIGUILLES PISTOLETS';
  String selectedGroup = 'Viande Rouge';
  String selectedState = 'Actif';
  String selectedVat = '14 %';

  final _formKey = GlobalKey<FormState>();
  double _fontsize = 15;

  ProductDataFieldState(this.product, this.isUpdate) {
    selectedMeasure = Measure(product.measure_id!);
    selectedPacktype = Packtype(product.packtype_id!);
    selectedType = Type(product.type_id!);
    selectedGroup = Grp(product.grp_id!);
    selectedState = State(product.state_id!);
    selectedVat = Vat(product.vat_id!);
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


    String Measure(String id){
        switch(id){
            case '2' :
                return 'Carton';
            case '3' :
                return 'Gramme';
            case '5' :
                return 'Heure';
            case '6' :
                return 'Jour';
            case '7' :
                return 'Metre';
            case '8' :
                return 'Litre';
            case '11' :
                return 'Bouteille';
            case '13' :
                return 'Tonne';
            case '14' :
                return 'Paquets';
            case '15' :
                return 'Pièce';
            case '1002' :
                return 'Milligramme';
            case '1003' :
                return 'Kg';
            case '1004' :
                return 'Abat';
            case '1005' :
                return 'Service';
            case '1006' :
                return 'UNT';
            default:
                return '';
        }
    }
    String Type(String type){
        switch(type){
            case '1' :
                return 'AIGUILLES PISTOLETS';
            case '2' :
                return 'ATTACHES ETIQUETTES';
            case '3' :
                return 'Agneau';
            case '4' :
                return 'Boeuf';
            case '5' :
                return 'Chevre';
            case '6' :
                return 'Emballage';
            case '7' :
                return 'Genisse';
            case '8' :
                return 'Vache';
            case '9' :
                return 'Veau';
            case '10' :
                return 'BOYAUX';
            case '11' :
                return 'CAISSES PLASTIQUE';
            case '13' :
                return 'Chevreau';
            case '14' :
                return 'COUTELLERIE';
            case '15' :
                return 'Dinde';
            case '17' :
                return 'Epice Marinade';
            case '8' :
                return 'FOURNITURE BUREAU';
            case '21' :
                return 'Agnelle';
            case '24' :
                return 'PISTOLET ';
            case '25' :
                return 'Produit hygiene';
            default:
                return '';
        }
    }
    String Packtype(String packtype){
        switch (packtype){
            case '1':
                return 'SOUS VIDE';
            case '2':
                return 'CARCASSE';
            case '3':
                return 'VRAC';
            default:
                return '';
        }
    }
    String Grp(String grp){
        switch (grp){
            case '4':
                return 'Viande Rouge';
            case '1023':
                return 'Ovins';
            case '1025':
                return 'Bovins';
            case '1027':
                return 'Caprin';
            case '1028':
                return 'Volaille';
            case '1029':
                return 'Produit hygiene';
            case '1030':
                return 'Produit Nettoyage';
            case '1031':
                return 'Epices ';
            case '1032':
                return 'Emballage';
            case '1033':
                return 'Legume frais Decouper';
            case '1034':
                return 'produits laitier';
            case '1035':
                return 'Service';
            case '1037':
                return 'FOURNITURE BUREAU';
            case '1038':
                return 'PRODUITS D\'ENTRETIEN';
            case '1039':
                return 'COUTELLERIE';
            case '1040':
                return 'CAISSES PLASTIQUE';
            case '1042':
                return 'VETEMENTS PRO';
            case '1043':
                return 'BOYAUX';
            case '1044':
                return 'ATTACHES D\'ETIQUETTES';
            case '1045':
                return 'PISTOLET';
            case '1046':
                return 'AIGUILLES ';
            case '1047':
                return 'COEUR';
            case '1048':
                return 'CHARCUTERIE';
            default:
                return '';
        }
    }
    String State(String state){
        switch (state){
            case '1':
                return 'Actif';
            case '2':
                return 'Non validé';
            case '3':
                return 'Bloqué';
            case '4':
                return 'Inactif';
            default:
                return '';
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
                return '';
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
    product.measure = selectedMeasure;
    product.packtype = selectedPacktype;
    product.type = selectedType;
    product.group = selectedGroup;
    product.state = selectedState;
    product.vat = selectedVat;
    product.type_id = TypeID(selectedType).toString();
    product.grp_id = GrpID(selectedGroup).toString();
    product.state_id = StateID(selectedState).toString();
    product.vat_id = VatID(selectedVat).toString();
    product.measure_id = MeasureID(selectedMeasure).toString();
    product.packtype_id = PacktypeID(selectedPacktype).toString();

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
                text: 'Envoyer',
                size: size,
                onPressed: () async {
                    isUpdate ? BlocProvider.of<ProductBloc>(context).add(
                    UpdateAllProductEvent(
                        product: product,))
                    : BlocProvider.of<ProductBloc>(context).add(
                    AddProductEvent(
                        product: product,));
                  //}
                }
                    )])));
  }
}