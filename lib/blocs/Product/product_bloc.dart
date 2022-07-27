import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/inventory/services/ProductService.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(ProductInitial(
            products: [],
            requestState: ProductRequestState.Loading,
            errorMessage: '')) {
    on<ProductEvent>((event, emit) async {
      print("we are here");
      try {
        emit(ProductInitial(
            products: [],
            requestState: ProductRequestState.Loading,
            errorMessage: ''));
        List<Product> products = [];
        await ProductService.getProducts().then((value) => products = value);
        emit(ProductInitial(
            products: products,
            requestState: ProductRequestState.Loaded,
            errorMessage: ''));
      } catch (e) {
        emit(ProductInitial(
            products: [],
            requestState: ProductRequestState.Error,
            errorMessage: e.toString()));
      }
    });
  }
}
