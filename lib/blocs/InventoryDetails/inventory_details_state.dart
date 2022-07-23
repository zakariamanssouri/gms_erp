part of 'inventory_details_bloc.dart';

enum DetailsRequestState { Loaded, Loading, Error, None, Searching, SearchLoaded }

class InventoryDetailsState extends Equatable {
  List<InventoryDetails> inventory_details = [];
  List<InventoryDetails>? search_result;
  DetailsRequestState requestState;
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
