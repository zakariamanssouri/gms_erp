part of 'inventory_details_bloc.dart';

abstract class InventoryDetailsEvent extends Equatable {
  const InventoryDetailsEvent();
  @override
  List<Object> get props => [];
}

class LoadInventoryDetails extends InventoryDetailsEvent {
  String id;
  List<InventoryDetails> inventory_details = [];

  LoadInventoryDetails(this.id);
  @override
  List<Object> get props => [id];
}

class SearchProductEvent extends InventoryDetailsEvent {
  String search_value;
  List<InventoryDetails> product_list = [];

  SearchProductEvent(this.search_value, this.product_list);

  @override
  List<Object> get props => [search_value, product_list];
}

class UpdateInventoryDetails extends InventoryDetailsEvent {
  InventoryDetails inventorydetails;

  UpdateInventoryDetails(this.inventorydetails);
  @override
  List<Object> get props => [inventorydetails];
}
