import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:test_app/features/product_list/domain/entities/product_entity.dart';
import 'package:test_app/features/product_list/domain/use_cases/get_all_products.dart';

part 'all_products_state.dart';

class AllProductsCubit extends Cubit<AllProductsState> {
  final GetAllProducts getAllProducts;
  AllProductsCubit({
    required this.getAllProducts,
  }) : super(AllProductsInitial());
  int page = 1;

  Future<void> getAProducts() async {
    if (page == 1) {
      emit(AllProductsLoading());
      await Future.delayed(const Duration(seconds: 2));
    } else {
      final currentState = state;
      var oldData = <ProductEntity>[];
      if (currentState is AllProductsSuccess) {
        oldData = currentState.data;
      }
      emit(AllProductsScrollLoading(oldData: oldData));
      await Future.delayed(const Duration(seconds: 1));
    }

    final res = await getAllProducts(ProductParams(page: page));
    res.fold(
      (error) => emit(
        const AllProductsFailure(msg: "No products found."),
      ),
      (result) {
        page++;
        final currentState = state;
        final data = <ProductEntity>[];
        if (currentState is AllProductsScrollLoading) {
          data.addAll(currentState.oldData);
        }
        data.addAll(result);
        emit(AllProductsSuccess(data: data));
      },
    );
  }
}
