part of 'all_products_cubit.dart';

sealed class AllProductsState extends Equatable {
  const AllProductsState();

  @override
  List<Object> get props => [];
}

final class AllProductsInitial extends AllProductsState {}

final class AllProductsLoading extends AllProductsState {}

final class AllProductsScrollLoading extends AllProductsState {
  final List<ProductEntity> oldData;
  const AllProductsScrollLoading({
    required this.oldData,
  });
}

final class AllProductsSuccess extends AllProductsState {
  final List<ProductEntity> data;
  const AllProductsSuccess({required this.data});
}

final class AllProductsFailure extends AllProductsState {
  final String msg;
  const AllProductsFailure({
    required this.msg,
  });
}
