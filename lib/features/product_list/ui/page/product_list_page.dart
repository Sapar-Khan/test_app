import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/features/product_list/domain/entities/product_entity.dart';
import 'package:test_app/features/product_list/ui/bloc/bloc.dart';

import '../widget/product_item_widget.dart';
import '../widget/shimmer_product_list_widget.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<AllProductsCubit>().getAProducts();

    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          context.read<AllProductsCubit>().getAProducts();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AllProductsCubit, AllProductsState>(
        builder: (context, state) {
          List<ProductEntity> data = [];
          bool isLoading = false;

          if (state is AllProductsLoading) {
            return const ShimmerProductListWidget();
          } else if (state is AllProductsScrollLoading) {
            isLoading = true;
            data = state.oldData;
          } else if (state is AllProductsSuccess) {
            data = state.data;
          } else if (state is AllProductsFailure) {
            return Center(
              child: Text(state.msg),
            );
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    mainAxisExtent: 300,
                  ),
                  itemCount: data.length,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemBuilder: (context, index) {
                    return ProductItemWidget(item: data[index]);
                  },
                ),
              ),
              if (isLoading) loadingIndicator(),
            ],
          );
        },
      ),
    );
  }

  Widget loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
