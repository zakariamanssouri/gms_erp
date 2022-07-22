part of 'inventory_bloc.dart';

abstract class InventoryEvent extends Equatable {
  const InventoryEvent();
  @override
  List<Object> get props => [];
}

class LoadInventories extends InventoryEvent {
  List<Inventory> inventories=[];
  @override
  List<Object> get props => [inventories];
}

class NoInternetEvent extends InventoryEvent {
  
}
