import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';
import 'package:gms_erp/inventory/services/InventoryService.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';
import 'package:http/http.dart';
part 'inventory_details_event.dart';
part 'inventory_details_state.dart';

class InventoryDetailsBloc
    extends Bloc<InventoryDetailsEvent, InventoryDetailsState> {
  InventoryService _inventoryService = InventoryService();

  InventoryDetailsBloc()
      : super(InventoryDetailsState([], DetailsRequestState.Loading, '')) {
    on<LoadInventoryDetails>(
      (event, emit) async {
        print("test LoadInventoryDetails");
        emit(InventoryDetailsState([], DetailsRequestState.Loading, ''));
        try {
          List<InventoryDetails> inventory_details = [];
          print('${event.id}');
          await _inventoryService
              .getInventoryDetails(event.id)
              .then((value) => inventory_details = value);
          emit(InventoryDetailsState(inventory_details, DetailsRequestState.Loaded, '',
              ));
          print('loaded');
        } catch (e) {
          print("error on block : " + e.toString());
          emit(InventoryDetailsState([], DetailsRequestState.Error, "error"));
        }
      },
    );
    on<SearchProductEvent>((event, emit) async {
      try {
        emit(InventoryDetailsState(
            event.product_list, DetailsRequestState.Searching, '',
            search_result: []));

        List<InventoryDetails> search_result = [];
        for (var i = 0; i < event.product_list.length; i++) {
          if (event.product_list[i].productName1
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.product_list[i].productNo
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase())) {
            search_result.add(event.product_list[i]);
          }
        }
        emit(InventoryDetailsState(
            event.product_list, DetailsRequestState.SearchLoaded, '',
            search_result: search_result));
      } catch (e) {
        emit(InventoryDetailsState([], DetailsRequestState.Error, "error"));
      }
    });
  }
}
