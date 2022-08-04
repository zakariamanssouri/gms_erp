

import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/Vendor.dart';

enum RequestState { Loaded, Loading, Error, None, Searching, SearchLoaded, Adding, Added, 
Updating, Updated }

class VendorState extends Equatable {
  List<Vendor> vendors = [];
  List<Vendor>? search_result;
  RequestState requestState;
  String errorMessage;

  VendorState(
      {
      required this.vendors,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        vendors,
        requestState,
        errorMessage,
      ];
}
