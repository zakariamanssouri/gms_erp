import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/crm/views/Product/products.dart';
import 'package:gms_erp/inventory/services/ProductService.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc()
      : super(ProductState(
            products: [],
            requestState: ProductRequestState.Loading,
            errorMessage: '')) {
    on<LoadAllProductsEvent>((event, emit) async {
      try {
        emit(ProductState(
            products: [],
            requestState: ProductRequestState.Loading,
            errorMessage: ''));
        List<Product> products = [];
        await ProductService.getProducts().then((value) => products = value);
        emit(ProductState(
            products: products,
            requestState: ProductRequestState.Loaded,
            errorMessage: ''));
      } catch (e) {
        emit(ProductState(
            products: [],
            requestState: ProductRequestState.Error,
            errorMessage: e.toString()));
      }
    });

    // implement on SearchProductEvent

    on<SearchProductEvent>((event, emit) async {
      try {
        print('------------------------------------');
        print("start search product event on product bloc");
        print("search value: ${event.search_value}");
        emit(ProductState(
            products: event.product_list,
            requestState: ProductRequestState.Searching,
            errorMessage: '',
            search_result: []));

        List<Product> search_result = [];
        for (var i = 0; i < event.product_list.length; i++) {
          if (event.product_list[i].name
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.product_list[i].code
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase())) {
            search_result.add(event.product_list[i]);
          }
        }
        print("search result: ${search_result.length}");
        emit(ProductState(
            products: event.product_list,
            search_result: search_result,
            requestState: ProductRequestState.SearchLoaded,
            errorMessage: ''));
        print('------------------------------------');
      } catch (e) {
        emit(ProductState(
            products: event.product_list,
            search_result: [],
            requestState: ProductRequestState.Error,
            errorMessage: ''));
      }
    });

    // on update product event
    on<UpdateProductEvent>((event, emit) async {
      try {
        print("update product event");
        await ProductService.updateProduct(event.product);
        add(LoadAllProductsEvent());
      } catch (e) {
        emit(ProductState(
            products: [],
            requestState: ProductRequestState.Error,
            errorMessage: ''));
      }
    });
  }
}
