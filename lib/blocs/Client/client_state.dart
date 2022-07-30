part of 'client_bloc.dart';

enum RequestState { Loaded, Loading, Error, None, Searching, SearchLoaded, Adding, Added }

class ClientState extends Equatable {
  List<Client> clients = [];
  List<Client>? search_result;
  RequestState requestState;
  String errorMessage;

  ClientState(
      {required this.clients,
      required this.requestState,
      required this.errorMessage,
      this.search_result});

  @override
  List<Object> get props => [
        clients,
        requestState,
        errorMessage,
      ];
}
