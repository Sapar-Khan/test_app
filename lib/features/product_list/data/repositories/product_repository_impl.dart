import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:test_app/core/error/failure.dart';
import 'package:test_app/features/product_list/data/data_sources/product_data_source.dart';
import 'package:test_app/features/product_list/domain/entities/product_entity.dart';
import 'package:test_app/features/product_list/domain/repositories/product_list_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource productDataSource;
  ProductRepositoryImpl({
    required this.productDataSource,
  });

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts(int page) async {
    try {
      final products = await productDataSource.getAllProducts(page);

      return Right(products);
    } catch (e, s) {
      log('getAllProducts', error: e, stackTrace: s);
      return Left(ServerFailure());
    }
  }
}
