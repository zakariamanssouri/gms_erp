import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/Client.dart';
import 'package:gms_erp/crm/services/ClientService.dart';
part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(ClientState(clients: [], requestState: RequestState.Loading, 
  errorMessage: '')) {
    on<LoadClients>((event, emit) async {
      emit(ClientState(clients:[], requestState: RequestState.Loading, errorMessage: ''));
      try {
        List<Client> clients = [];
        await ClientService
            .getClients()
            .then((value) => clients = value);
        emit(ClientState(clients:clients, requestState: RequestState.Loaded, errorMessage: ''));
      } catch (e) {
        print("error on block Client bloc : $e");
        emit(ClientState(clients:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });

    on<SearchClientEvent>((event, emit) async {
      try {
        emit(ClientState(clients:
            event.client_list, requestState: RequestState.Searching, errorMessage: '',
            search_result: []));

        List<Client> search_result = [];
        for (var i = 0; i < event.client_list.length; i++) {
          if (event.client_list[i].no
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase()) ||
              event.client_list[i].name
                  .toLowerCase()
                  .contains(event.search_value.toLowerCase())) {
            search_result.add(event.client_list[i]);
          }
        }
        emit(ClientState(clients:
            event.client_list, requestState: RequestState.SearchLoaded, errorMessage: '',
            search_result: search_result));
      } catch (e) {
        emit(ClientState(clients:[], requestState: RequestState.Error, errorMessage: "error"));
      }
    });
    
    on<AddClientEvent>((event, emit) async {
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
  }
}
