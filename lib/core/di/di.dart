import 'package:get_it/get_it.dart';
import 'package:test_app/features/product_list/data/data_sources/product_data_source.dart';
import 'package:test_app/features/product_list/data/repositories/product_repository_impl.dart';
import 'package:test_app/features/product_list/domain/repositories/product_list_repository.dart';

import '../../features/product_list/domain/use_cases/get_all_products.dart';
import '../../features/product_list/ui/bloc/bloc.dart';

final di = GetIt.instance;

Future<void> intiGetIt() async {
  di.registerFactory(() => AllProductsCubit(getAllProducts: di()));
  di.registerLazySingleton(() => GetAllProducts(di()));
  di.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(productDataSource: di()),
  );

  di.registerLazySingleton<ProductDataSource>(
    () => ProductDataSourceImpl(),
  );
}
