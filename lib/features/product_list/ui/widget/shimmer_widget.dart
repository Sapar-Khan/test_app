import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  const ShimmerWidget({
    Key? key,
    required this.height,
    required this.width,
    this.child,
    this.borderRadius = 0,
  }) : super(key: key);
  final double width;
  final double height;
  final Widget? child;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: (child == null)
          ? Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              // child: child,
            )
          : child!,
    );
  }
}
