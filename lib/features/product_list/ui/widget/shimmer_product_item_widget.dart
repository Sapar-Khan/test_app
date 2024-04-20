import 'package:flutter/material.dart';

import 'shimmer_widget.dart';

class ShimmerProductItemWidget extends StatelessWidget {
  const ShimmerProductItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerWidget(
          width: double.infinity,
          height: 170,
          borderRadius: 10,
        ),
        SizedBox(height: 6),
        ShimmerWidget(
          width: 100,
          height: 12,
          borderRadius: 10,
        ),
        SizedBox(height: 6),
        ShimmerWidget(
          width: 100,
          height: 16,
          borderRadius: 10,
        ),
        SizedBox(height: 6),
        Row(
          children: [
            ShimmerWidget(
              width: 20,
              height: 20,
              borderRadius: 100,
            ),
            SizedBox(
              width: 2,
            ),
            ShimmerWidget(
              width: 20,
              height: 20,
              borderRadius: 100,
            ),
            SizedBox(
              width: 2,
            ),
            ShimmerWidget(
              width: 20,
              height: 20,
              borderRadius: 100,
            ),
            Spacer(),
            ShimmerWidget(
              width: 90,
              height: 12,
              borderRadius: 10,
            ),
          ],
        )
      ],
    );
  }
}
