part of 'product_details_bloc.dart';

enum UpdateRequestState { Updating, Updated, Error }

abstract class ProductDetailsState extends Equatable {
  const ProductDetailsState();

  @override
  List<Object> get props => [];
}

class ProductDetailsInitial extends ProductDetailsState {
  UpdateRequestState? requeststate;
  String? errorMessage;
  ProductDetailsInitial({this.requeststate, this.errorMessage});
}
