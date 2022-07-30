import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/views/Product/addProductNextPage.dart';
import 'package:gms_erp/crm/views/Product/productItem.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/widgets/ErrorWithRefreshButtonWidget.dart';

import '../../../blocs/Product/product_bloc.dart';
import '../../../widgets/ButtonWidget.dart';
import '../../../widgets/TextFieldWiget.dart';
import '../../models/Product.dart';


class AddProductPage extends StatelessWidget {
  Product product = Product(id: '', no: '', name: '', s_price: '', stock_min: '', code: '', s_price_min: '');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AddingWidget(product: product);
  }
}

class AddingWidget extends StatelessWidget {
  const AddingWidget({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: GlobalParams.backgroundColor,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.grey[200],
          elevation: 0,
          title: const Text(
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
                  state.requestState == ProductRequestState.Loading)
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
              // Error
              if (state.requestState == ProductRequestState.Error){
              ErrorWithRefreshButtonWidget(
                inventory: null,
                button_function: () {
                  print(BlocProvider.of<ProductBloc>(
                                      context));
                  BlocProvider.of<ProductBloc>(context)
                      .add(LoadAllProductsEvent());
                },
              );
                    }
                   },child: ProductDataField(product: product), // Error
            ),
          )]),
          )
          ),
        );
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
  TextEditingController numController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController purPriceController = TextEditingController();
  TextEditingController salesPriceController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  
  String? num, name, code, purPrice, salesPrice, stock;
  
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
    numController.text = '';
    nameController.text = '';
    codeController.text = '';
    purPriceController.text = '';
    salesPriceController.text = '';
    stockController.text = '';
  }

  String? validateNumber(String value) {
    if (value == null || value.isEmpty) {
      return 'Veuillez remplir le champs';
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
      return 'Veuillez remplir le champs';
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
                    return validateField(value!);
                  },
                  obj: product,
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
                  obj: product,
                  labeltext: 'Nom',
                  valuetext: '',),
              SizedBox(height: size.height * 0.02),

              
              TextFieldWidget(
                  controller: codeController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  validator: (value) {
                    return validateField(value!);
                  },
                  obj: product, valuetext: '', labeltext: 'Code Bar',),
              SizedBox(height: size.height * 0.02),

              TextFieldWidget(
                  controller: purPriceController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  validator: (value) {
                    return validateField(value!);
                  },
                  obj: product, valuetext: '', labeltext: 'Prix d\'achat',),
              SizedBox(height: size.height * 0.02),

              TextFieldWidget(
                  controller: salesPriceController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  validator: (value) {
                    return validateField(value!);
                  },
                  obj: product, valuetext: '', labeltext: 'Prix de vente',),
              SizedBox(height: size.height * 0.02),

              TextFieldWidget(
                  controller: stockController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  validator: (value) {
                    return validateField(value!);
                  },
                  obj: product, valuetext: '', labeltext: 'Stock Min',),
              SizedBox(height: size.height * 0.04),

              ButtonWidget(
                text: 'Suivant',
                size: size,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    name = nameController.text;
                    num = numController.text;
                    code = codeController.text;
                    purPrice = purPriceController.text;
                    salesPrice = salesPriceController.text;
                    stock = stockController.text;
                    
                    Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return BlocProvider.value(
                                  value: BlocProvider.of<ProductBloc>(
                                      context),
                                      child: AddProductNextPage(name: name!,
                    num: num!, code: code!, purPrice: purPrice!, salesPrice: salesPrice!, stock: stock!));}));
                  }
                }
                    )])));
  }
}