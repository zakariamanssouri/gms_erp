import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/Product.dart';
import 'package:gms_erp/inventory/models/stock.dart';
import 'package:gms_erp/inventory/services/stock.service.dart';
import 'package:gms_erp/shared/services/ProductService.dart';
part 'stock_event.dart';
part 'stock_state.dart';

class StockBlock extends Bloc<StockEvent, StockState> {
  StockBlock()
      : super(StockState(
            products: [],
            requestState: StockRequestState.Loading,
            errorMessage: '')) {
    on<LoadStockEvent>((event, emit) async {
      try {
        print("load stock event");
        emit(StockState(
            products: [],
            requestState: StockRequestState.Loading,
            errorMessage: ''));
        List<Stock> products = [];
        await StockService.getProducts().then((value) => products = value);
        print(products.length);
        emit(StockState(
            products: products,
            requestState: StockRequestState.Loaded,
            errorMessage: ''));
      } catch (e) {
        print(e);
        emit(StockState(
            products: [],
            requestState: StockRequestState.Error,
            errorMessage: e.toString()));
      }
    });

    on<SearchStockEvent>((event, emit) async {
      try {
        print('------------------------------------');
        print("start search product event on product bloc");
        print("search value: ${event.search_value}");
        emit(StockState(
            products: event.product_list,
            requestState: StockRequestState.Searching,
            errorMessage: '',
            search_result: []));

        List<Stock> search_result = [];
        for (var i = 0; i < event.product_list.length; i++) {
          if (event.product_list[i].eanCode!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.product_list[i].productName1!
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase())) {
            search_result.add(event.product_list[i]);
          }
        }
        print("search result: ${search_result.length}");
        emit(StockState(
            products: event.product_list,
            search_result: search_result,
            requestState: StockRequestState.SearchLoaded,
            errorMessage: ''));
        print('------------------------------------');
      } catch (e) {
        emit(StockState(
            products: event.product_list,
            search_result: [],
            requestState: StockRequestState.Error,
            errorMessage: ''));
      }
    });

  
  }
}
