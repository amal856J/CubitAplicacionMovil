class Product {
  final String name;
  final String? description;
  final double price;
  final int discount;
  final int stock;
  final int quantity; // Añadir esta línea si aún no la tienes

  Product({
    required this.name,
    this.description,
    required this.price,
    required this.discount,
    required this.stock,
    this.quantity = 1, // Establecer un valor por defecto
  });

  Product copyWith({
    String? name,
    String? description,
    double? price,
    int? discount,
    int? stock,
    int? quantity,
  }) {
    return Product(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      discount: discount ?? this.discount,
      stock: stock ?? this.stock,
      quantity: quantity ?? this.quantity,
    );
  }
}
