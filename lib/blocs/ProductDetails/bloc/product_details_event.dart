part of 'product_details_bloc.dart';

abstract class ProductDetailsEvent extends Equatable {
  const ProductDetailsEvent();

  @override
  List<Object> get props => [];
}


class UpdateProductDetailsEvent extends ProductDetailsEvent {
  final InventoryDetails inventoyDetails;

  const UpdateProductDetailsEvent(this.inventoyDetails);

  @override
  List<Object> get props => [inventoyDetails];
}
