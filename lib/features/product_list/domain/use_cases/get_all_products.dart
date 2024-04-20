import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/features/product_list/domain/entities/product_entity.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/use_case/use_case.dart';
import '../repositories/product_list_repository.dart';

class GetAllProducts extends UseCase<List<ProductEntity>, ProductParams> {
  final ProductRepository repository;
  GetAllProducts(this.repository);
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
    ProductParams params,
  ) async {
    return await repository.getAllProducts(params.page);
  }
}

class ProductParams extends Equatable {
  final int page;

  const ProductParams({required this.page});

  @override
  List<Object?> get props => [page];
}
