//part of 'vendor_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../crm/models/Vendor.dart';

abstract class VendorEvent extends Equatable {
  const VendorEvent();
  @override
  List<Object> get props => [];
}

class LoadVendors extends VendorEvent {
  List<Vendor> vendors=[];
  @override
  List<Object> get props => [vendors];
}


class SearchVendorEvent extends VendorEvent {
  String search_value;
  List<Vendor> vendor_list = [];

  SearchVendorEvent(this.search_value, this.vendor_list);

  @override
  List<Object> get props => [search_value, vendor_list];
}

class UpdateVendorEvent extends VendorEvent {
  Vendor vendor;

  UpdateVendorEvent({required this.vendor});
  @override
  List<Object> get props => [vendor];
}


class AddVendorEvent extends VendorEvent {
  Vendor vendor;
  
  AddVendorEvent({required this.vendor});

  @override
  List<Object> get props => [vendor];
}

class InitializingEvent extends VendorEvent {
  
}