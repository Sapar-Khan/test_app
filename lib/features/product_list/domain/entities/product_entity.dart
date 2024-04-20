class ProductEntity {
  final int id;
  final String name;
  final String ava;
  final int countLeft;
  final List<String> colors;
  final double price;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.ava,
    required this.countLeft,
    required this.colors,
    required this.price,
    required this.isFavorite,
  });
}
