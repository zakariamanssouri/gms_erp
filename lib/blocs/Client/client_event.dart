part of 'client_bloc.dart';

abstract class ClientEvent extends Equatable {
  const ClientEvent();
  @override
  List<Object> get props => [];
}

class LoadClients extends ClientEvent {
  List<Client> clients=[];
  @override
  List<Object> get props => [clients];
}


class SearchClientEvent extends ClientEvent {
  String search_value;
  List<Client> client_list = [];

  SearchClientEvent(this.search_value, this.client_list);

  @override
  List<Object> get props => [search_value, client_list];
}

class UpdateClient extends ClientEvent {
  Client client;

  UpdateClient(this.client);
  @override
  List<Object> get props => [client];
}
