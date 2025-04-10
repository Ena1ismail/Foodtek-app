class FoodItem {
  final int? id;
  final String? name;
  final String? description;
  final double? newPrice;
  final double? oldPrice;
  final String? imageUrl;
  final String? category;
  final double? rating;
  final String? ingredients;
  final int? reviews;
  int? quantity;

  FoodItem({
    this.id,
    this.name,
    this.description,
    this.newPrice,
    this.oldPrice,
    this.imageUrl,
    this.category = "cate",
    this.rating,
    this.ingredients,
    this.reviews,
    this.quantity,
  });

  FoodItem copyWith({
    int? id,
    String? name,
    String? description,
    double? newPrice,
    double? oldPrice,
    String? imageUrl,
    String? category,
    double? rating,
    String? ingredients,
    int? reviews,
    int? quantity,
  }) {
    return FoodItem(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      newPrice: newPrice ?? this.newPrice,
      oldPrice: oldPrice ?? this.oldPrice,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      rating: rating ?? this.rating,
      ingredients: ingredients ?? this.ingredients,
      reviews: reviews ?? this.reviews,
      quantity: quantity ?? this.quantity,
    );
  }
}