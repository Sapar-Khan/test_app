import 'package:test_app/features/product_list/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({
    required super.id,
    required super.name,
    required super.ava,
    required super.countLeft,
    required super.colors,
    required super.price,
    required super.isFavorite,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        ava: json['ava'] ?? '',
        countLeft: json['count_left'] ?? 0,
        colors: ((json['colors'] ?? []) as List<dynamic>)
            .map((color) => color as String)
            .toList(),
        price: json['price'] ?? 0,
        isFavorite: json['is_favorite'] ?? false,
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "ava": ava,
      "countLeft": countLeft,
      "colors": colors,
      "price": price,
      "isFavorite": isFavorite,
    };
  }
}
