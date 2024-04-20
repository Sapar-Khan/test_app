import 'package:flutter/material.dart';

class ProductColorWidget extends StatelessWidget {
  const ProductColorWidget({
    super.key,
    required this.color,
  });
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      margin: const EdgeInsets.only(right: 2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
