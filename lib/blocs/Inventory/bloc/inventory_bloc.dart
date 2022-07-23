import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/inventory/models/Inventory.dart';
import 'package:gms_erp/inventory/services/InventoryService.dart';
part 'inventory_event.dart';
part 'inventory_state.dart';

class InventoryBloc extends Bloc<InventoryEvent, InventoryState> {
  InventoryService _inventoryService = InventoryService();
  InventoryBloc() : super(InventoryState([], RequestState.Loading, '')) {
    on<LoadInventories>((event, emit) async {
      emit(InventoryState([], RequestState.Loading, ''));
      try {
        List<Inventory> inventories = [];
        await _inventoryService
            .getInventories()
            .then((value) => inventories = value);
        emit(InventoryState(inventories, RequestState.Loaded, ''));
      } catch (e) {
        print("error on block Inventory bloc : $e");
        emit(InventoryState([], RequestState.Error, "error"));
      }
    });
  }
}
