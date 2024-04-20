import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/product_entity.dart';
import 'product_color_widget.dart';

class ProductItemWidget extends StatelessWidget {
  final ProductEntity item;
  const ProductItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey,
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: item.ava,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          "${item.countLeft} stock bicycle left",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: item.countLeft > 10 ? Colors.green : Colors.red,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.name,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const ProductColorWidget(color: Colors.black),
            const ProductColorWidget(color: Colors.green),
            const ProductColorWidget(color: Colors.red),
            Expanded(
              child: Text(
                '\$ ${item.price}',
                textAlign: TextAlign.end,
              ),
            ),
          ],
        )
      ],
    );
  }
}
