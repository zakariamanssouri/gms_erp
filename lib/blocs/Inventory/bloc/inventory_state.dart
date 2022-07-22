part of 'inventory_bloc.dart';


enum RequestState{Loaded,Loading,Error,None}


class InventoryState extends Equatable {
  List<Inventory> inventories;
  RequestState requestState;
  String errorMessage;
  InventoryState(this.inventories,this.requestState,this.errorMessage);
  
  @override
  List<Object> get props => [inventories,requestState,errorMessage];
}

