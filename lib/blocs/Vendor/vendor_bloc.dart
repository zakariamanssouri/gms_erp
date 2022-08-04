// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:gms_erp/blocs/Vendor/vendor_event.dart';
import 'package:gms_erp/blocs/Vendor/vendor_state.dart';
import 'package:gms_erp/crm/models/Vendor.dart';
import 'package:gms_erp/crm/services/VendorService.dart';


class VendorBloc extends Bloc<VendorEvent, VendorState> {
  VendorBloc() : super(VendorState(vendors: const [], requestState: RequestState.Loading, 
  errorMessage: '')) {
    on<LoadVendors>((event, emit) async {
      emit(VendorState(vendors:const [], requestState: RequestState.Loading, errorMessage: 'mmm'));
      try {
        List<Vendor> vendors = [];
        await VendorService
            .getVendors()
            .then((value) => vendors = value);
        emit(VendorState(vendors:vendors, requestState: RequestState.Loaded, errorMessage: 'good'));
      } catch (e) {
        print("error on block vendor bloc : $e");
        emit(VendorState(vendors:const [], requestState: RequestState.Error, errorMessage: "error"));
      }
    });

    on<SearchVendorEvent>((event, emit) async {
      try {
        emit(VendorState(vendors:
            event.vendor_list, requestState: RequestState.Searching, errorMessage: '',
            search_result: []));

        List<Vendor> search_result = [];
        for (var i = 0; i < event.vendor_list.length; i++) {
          if (event.vendor_list[i].vendorNo
                  !.startsWith(event.search_value.toLowerCase()) ||
              event.vendor_list[i].vendorName1!
                  .toLowerCase()
                  .startsWith(event.search_value.toLowerCase())) {
            search_result.add(event.vendor_list[i]);
          }
        }
        emit(VendorState(vendors:
            event.vendor_list, requestState: RequestState.SearchLoaded, errorMessage: '',
            search_result: search_result));
      } catch (e) {
        emit(VendorState(vendors:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });
    
    /* on<AddClientEvent>((event, emit) async {
      try {
        emit(ClientState(
            clients: state.clients,
            requestState: RequestState.Adding,
            errorMessage: ''));
        print("add client event");
        await ClientService.addClient(event.client).then((value) {
            if(value){
           emit(ClientState(
            clients: state.clients,
            requestState: RequestState.Added,
            errorMessage: ''));
         
          }
          else{
            emit(ClientState(
              clients: state.clients,
              requestState: RequestState.Error,
              errorMessage: 'error'));
          }
        });
      
      } catch (e) {
        emit(ClientState(
            clients: state.clients,
            requestState: RequestState.Error,
            errorMessage: 'error'));
      }
    });
    
    on<InitializingEvent>((event, emit) async {
        emit(ClientState(
            clients: [],
            requestState: RequestState.None,
            errorMessage: ''));
        print("initializing event");
    });

    on<UpdateClientEvent>((event, emit) async {
      try {
        emit(ClientState(
            clients: state.clients,
            requestState: RequestState.Updating,
            errorMessage: ''));
        print("update client event");
        await ClientService.updateClient(event.client).then((value) {
            if(value){
              emit(ClientState(
              clients: state.clients,
              requestState: RequestState.Updated,
              errorMessage: ''));
         
        }
        else{
          emit(ClientState(
            clients: state.clients,
            requestState: RequestState.Error,
            errorMessage: 'error'));
        }
        });
      
      } catch (e) {
        emit(ClientState(
            clients: state.clients,
            requestState: RequestState.Error,
            errorMessage: 'error'));
      }
    });
  } */
}
}