import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/InventoryDetails/inventory_details_bloc.dart';
import 'package:gms_erp/blocs/Product/product_bloc.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/inventory/services/inventory.service.dart';
import '../../models/Inventory_details.dart';
import 'Widgets/TextFieldWidget.dart';
import 'Widgets/ButtonWidget.dart';

class ProductDetails extends StatelessWidget {
  InventoryDetails inventoryDetails;
  double _fontsize = 14;
  ProductDetails({required this.inventoryDetails});
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
          title: const Text(
            "Product Details",
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w900,
                fontSize: 19,
                fontFamily: 'Open Sans'),
          ),
        ),
        body: BlocListener<InventoryDetailsBloc, InventoryDetailsState>(
          listener: (context, state) {
            if (state.requestState == DetailsRequestState.Updated) {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.success,
                text: 'le produit a été mis à jour avec succès',
              );
              BlocProvider.of<InventoryDetailsBloc>(context)
                  .add(LoadInventoryDetails(inventoryDetails.inventoryId));
              Navigator.pop(context);
            } else if (state.requestState == DetailsRequestState.Error) {
              CoolAlert.show(
                context: context,
                type: CoolAlertType.error,
                text: 'Erreur lors de la mise à jour du produit',
              );
            }
            // TODO: implement listener
          },
          child: Container(
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

                // product name
                Text(
                  inventoryDetails.productName1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Open Sans',
                  ),
                ),
                // product name
                SizedBox(height: size.height * 0.01),

                // Location Name

                // Product Number
                Text(
                  "Number: ${inventoryDetails.productNo}",
                  style:
                      TextStyle(fontSize: _fontsize, fontFamily: 'Open Sans'),
                ),
                // Product Number

                SizedBox(height: size.height * 0.02),

                // location with icon
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: Colors.blue,
                    ),
                    SizedBox(width: 5),
                    Text("Location : ${inventoryDetails.stockLocationName}",
                        style: TextStyle(
                            fontSize: _fontsize,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w300)),
                  ],
                ),
                // location with icon

                SizedBox(height: size.height * 0.02),

                // Inventory Number
                Text(
                  "Inventory Number: ${inventoryDetails.inventoryNumber}",
                  style:
                      TextStyle(fontSize: _fontsize, fontFamily: 'Open Sans'),
                ),
                // Inventory Number

                SizedBox(height: size.height * 0.02),
                Text(
                  "Lot Number : ${inventoryDetails.batchNo}",
                  style:
                      TextStyle(fontSize: _fontsize, fontFamily: 'Open Sans'),
                ),
                // Lot

                SizedBox(height: size.height * 0.02),

                // Form for editing qunaity and price
                Builder(builder: (context) {
                  return QuantityAndPriceForm(
                      inventoryDetails: inventoryDetails);
                }),
                // Form for editing qunaity and price

                SizedBox(height: size.height * 0.02),

                // Lot Number

                // End date

                SizedBox(height: size.height * 0.02),

                //Update Button

                //Update Button
              ],
            ),
          ),
        ));
  }
}

class QuantityAndPriceForm extends StatefulWidget {
  InventoryDetails inventoryDetails;
  QuantityAndPriceForm({Key? key, required this.inventoryDetails})
      : super(key: key);

  @override
  State<QuantityAndPriceForm> createState() =>
      QuantityAndPriceFormState(inventoryDetails);
}

class QuantityAndPriceFormState extends State<QuantityAndPriceForm> {
  final InventoryDetails inventoryDetails;
  TextEditingController quantityController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  InventoryService _inventoryService = InventoryService();

  final _formKey = GlobalKey<FormState>();
  double _fontsize = 15;
  late DateTime _enddate;

  QuantityAndPriceFormState(this.inventoryDetails) {
    _enddate = DateTime.parse(inventoryDetails.validTo);
    quantityController.text = inventoryDetails.qty.toString();
    priceController.text = inventoryDetails.singlePrice.toString();
  }

  // regex for validating price

  String? validateField(String value) {
    if (value.isEmpty) {
      return 'Please enter some text';
    } else {
      String pattern = r'^\d+\.\d{1,}$|^\d+$';
      RegExp regex = RegExp(pattern);
      if (!regex.hasMatch(value)) {
        return 'Entrer Un Nombre Valide';
      }
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
              Text(
                "Old Quantity ${widget.inventoryDetails.qtyOrig.toString()} ${widget.inventoryDetails.measureName}",
                style: TextStyle(fontSize: _fontsize, fontFamily: 'Open Sans'),
              ),
              SizedBox(height: size.height * 0.02),
              TextFieldWidget(
                  validator: (value) {
                    return validateField(value!);
                  },
                  controller: quantityController,
                  inventoryDetails: inventoryDetails,
                  labeltext: 'New Qunatity',
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  valuetext: "${widget.inventoryDetails.qty}"),

              SizedBox(height: size.height * 0.02),
              Text(
                "Old Price : ${widget.inventoryDetails.singlePrice}",
                style: TextStyle(fontSize: _fontsize, fontFamily: 'Open Sans'),
              ),
              SizedBox(height: size.height * 0.02),
              TextFieldWidget(
                  controller: priceController,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: false, decimal: true),
                  inventoryDetails: inventoryDetails,
                  validator: (value) {
                    return validateField(value!);
                  },
                  labeltext: 'New Price ',
                  valuetext: "${widget.inventoryDetails.singlePrice}"),
              SizedBox(height: size.height * 0.02),

              // End date
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Valid to : ${widget.inventoryDetails.validTo.toString().substring(0, 10)}",
                    style:
                        TextStyle(fontSize: _fontsize, fontFamily: 'Open Sans'),
                  ),
                  Container(
                    width: 23,
                    height: 23,
                    child: FloatingActionButton(
                      child: Icon(
                        Icons.edit,
                        size: 13,
                      ),
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2030))
                            .then((value) {
                          setState(() {
                            widget.inventoryDetails.validTo = value.toString();
                          });
                        });
                      },
                      mini: true,
                    ),
                  )
                ],
              ),
              SizedBox(height: size.height * 0.03),
              ButtonWidget(
                size: size,
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    inventoryDetails.qty =
                        double.parse(quantityController.text);

                    BlocProvider.of<InventoryDetailsBloc>(context)
                        .add(UpdateInventoryDetails(inventoryDetails));
                  }
                },
              ),
            ],
          )),
    );
  }
}
