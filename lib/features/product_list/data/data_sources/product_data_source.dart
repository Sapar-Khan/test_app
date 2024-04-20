import 'dart:math';

import '../models/product_model.dart';

abstract class ProductDataSource {
  Future<List<ProductModel>> getAllProducts(int page);
}

class ProductDataSourceImpl implements ProductDataSource {
  @override
  Future<List<ProductModel>> getAllProducts(int page) async {
    List<Map<String, dynamic>> productJson =
        List.generate(16, (index) => generateOnlyProduct());

    return productJson
        .map((product) => ProductModel.fromJson(product))
        .toList();
  }

  Map<String, dynamic> generateOnlyProduct() {
    return {
      "name": generateRandomString(30),
      "ava":
          "https://i.pinimg.com/originals/91/ce/c1/91cec16ac56402a54968b3890119f644.png",
      "count_left": 1 + Random().nextInt(20),
      "colors": ["black", "green", "red"],
      "price": (1000 + Random().nextInt(10000)).toDouble(),
      "is_favorite": false,
    };
  }

  String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }
}
