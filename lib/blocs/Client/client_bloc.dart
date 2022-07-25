import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gms_erp/crm/models/Client.dart';
import 'package:gms_erp/crm/services/ClientService.dart';
part 'client_event.dart';
part 'client_state.dart';

class ClientBloc extends Bloc<ClientEvent, ClientState> {
  ClientBloc() : super(ClientState([], RequestState.Loading, '')) {
    on<LoadClients>((event, emit) async {
      emit(ClientState([], RequestState.Loading, ''));
      try {
        List<Client> clients = [];
        await ClientService
            .getClients()
            .then((value) => clients = value);
        emit(ClientState(clients, RequestState.Loaded, ''));
      } catch (e) {
        print("error on block Client bloc : $e");
        emit(ClientState([], RequestState.Error, "error"));
      }
    });
  }
}
