import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gms_erp/blocs/Vendor/vendor_bloc.dart';
import 'package:gms_erp/blocs/Vendor/vendor_state.dart';
import 'package:gms_erp/config/global_params.dart';
import 'package:gms_erp/crm/models/Vendor.dart';


class VendorItem extends StatefulWidget {
  Vendor vendor;
  VendorItem({Key? key, required this.vendor}) : super(key: key);
  @override
  _VendorItemState createState() => _VendorItemState();
}

class _VendorItemState extends State<VendorItem> {
  final Key keyOne = const PageStorageKey('Infos');


  int currentTab = 0;

  late PageOne one;
  
  late List<Widget> pages;
  late Widget currentPage;

  final PageStorageBucket bucket = PageStorageBucket();

  @override
  void initState() {
    one = PageOne(
      key: keyOne,
      vendor: widget.vendor,
    );
    pages = [one];

    currentPage = one;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return Scaffold(
      appBar: AppBar(
        title: Text("Fornisseur ${widget.vendor.id}"),
      ),
      body: PageStorage(
        child: currentPage,
        bucket: bucket,
      ),
    );
  }
}

class PageOne extends StatefulWidget {
  
  Vendor vendor;
  PageOne({
    Key? key,
    required this.vendor
  }) : super(key: key);

  @override
  PageOneState createState() => PageOneState(vendor: vendor);
}

class PageOneState extends State<PageOne> {
  
  Vendor vendor;
  PageOneState({required this.vendor});

  @override
  Widget build(BuildContext context) {
    BuildContext _context = context;
    return BlocListener<VendorBloc, VendorState>(
            listener: (context, state) {
              if (state.requestState == RequestState.Error) {
                CoolAlert.show(
                  context: context,
                  type: CoolAlertType.error,
                  text: 'Erreur lors du chargement du client',
                );
              }
            },
            child: ListView(children: <Widget>[
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Icon(Icons.account_box_outlined,
                color: Colors.black),
                title: Text(vendor.getId,
                  style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300),
                ),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Icon(Icons.phone_android_outlined,
                color: Colors.black),
                title: Text(vendor.getcountryName,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Numéro',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                    title: Text(vendor.getvendorName1,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              Card(
                  child: ListTile(
                minLeadingWidth: 70,
                leading: const Text('Group',
                    style: TextStyle(
                        fontFamily: GlobalParams.MainfontFamily,
                        fontWeight: FontWeight.w900)),
                title: Text(vendor.getdisplayName,
                    style: const TextStyle(
                      fontFamily: GlobalParams.MainfontFamily,
                      fontWeight: FontWeight.w300,
                    )),
              )),
              
              
              Container(width: double.infinity, alignment: Alignment.bottomRight ,child: FloatingActionButton(
                onPressed: () {
                  print(vendor.city);
                          Navigator.push(_context,
                              MaterialPageRoute(builder: (context)
                               {
                                   return BlocProvider.value( value: BlocProvider.of<VendorBloc>( _context));
                               }));},
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.edit,
                  color: Colors.blue,
                ),
              ),)
            ]));
  }
}



