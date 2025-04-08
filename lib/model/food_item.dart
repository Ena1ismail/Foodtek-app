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
  int? quantity = 0;

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
    this.quantity
  });

}