part of 'inventory_bloc.dart';

enum RequestState { Loaded, Loading, Error, None, Searching, SearchLoaded }

class InventoryDetailsState extends Equatable {
  List<InventoryDetails> inventory_details = [];
  List<InventoryDetails>? search_result;
  RequestState requestState;
  String errorMessage;

  InventoryDetailsState(
      this.inventory_details, this.requestState, this.errorMessage,
      {this.search_result});

  @override
  List<Object> get props => [
        inventory_details,
        requestState,
        errorMessage,
      ];
}
