class ProductModel {
  final String id;
  final String name;
  final double price;
  final String imageUrl;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.imageUrl,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'].toString(),
      name: json['title'],
      price: (json['price'] as num).toDouble(),
      imageUrl: json['image'],
    );
  }
}
