part of 'client_bloc.dart';

enum RequestState { Loaded, Loading, Error, None, Searching, SearchLoaded }

class ClientState extends Equatable {
  List<Client> clients = [];
  List<Client>? search_result;
  RequestState requestState;
  String errorMessage;

  ClientState(
      this.clients, this.requestState, this.errorMessage,
      {this.search_result});

  @override
  List<Object> get props => [
        clients,
        requestState,
        errorMessage,
      ];
}
