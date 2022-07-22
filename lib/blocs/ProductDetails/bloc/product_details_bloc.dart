import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/inventory/models/Inventory_details.dart';
import 'package:gms_erp/inventory/views/InventoryDetails/Inventory_details_page.dart';

part 'product_details_event.dart';
part 'product_details_state.dart';

class ProductDetailsBloc
    extends Bloc<ProductDetailsEvent, ProductDetailsState> {
  ProductDetailsBloc() : super(ProductDetailsInitial()) {
    on<UpdateProductDetailsEvent>((event, emit) {
      print("hit event");
      emit(ProductDetailsInitial(
          requeststate: UpdateRequestState.Updating, errorMessage: ''));
    });
  }
}
