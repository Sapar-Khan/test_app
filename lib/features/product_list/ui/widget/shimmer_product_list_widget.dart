import 'package:flutter/material.dart';

import 'shimmer_product_item_widget.dart';

class ShimmerProductListWidget extends StatelessWidget {
  const ShimmerProductListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        mainAxisExtent: 280,
      ),
      itemCount: 6,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemBuilder: (context, index) {
        return const ShimmerProductItemWidget();
      },
    );
  }
}
