import 'package:flutter/material.dart';
import '../../model/notification_item.dart';
import '../view/widgets/food_item_widget.dart';
import '../view/widgets/recommend_item_widget.dart';
import '../view/widgets/top_rated_widget.dart';

class HomePageController extends ChangeNotifier {
  TextEditingController searchTextEditingController = TextEditingController();
  int selectedIndex = 0;
  int selectedToggleIndex = 0;
  String selectedCategory = "All";

  void updateSelectedCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      notifyListeners();
    }
  }

  List<Widget> getItemsForCategory() {
    switch (selectedCategory) {
      case "Pizza":
        return pizza;
      case "Burger":
        return burger;
      case "Sandwich":
        return sandwich;
      default:
        return [];
    }
  }

  final List<TopRatedWidget> topRatedItems = [
    TopRatedWidget(
      rating: "3.8",
      image: "assets/images/top_rated1.png",
      name: "Chicken burger",
      ingredients: "100 gr chicken + tomato + cheese Lettuce",
      price: "\$20.00",
    ),
    TopRatedWidget(
      rating: "4.5",
      image: "assets/images/top_rated2.png",
      ingredients: "100 gr meat + onion + tomato + Lettuce cheese",
      name: "Cheese burger",
      price: "\$15.00",
    ),
    TopRatedWidget(
      rating: "3.8",
      image: "assets/images/top_rated1.png",
      name: "Chicken burger",
      ingredients: "100 gr chicken + tomato + cheese Lettuce",
      price: "\$20.00",
    ),
    TopRatedWidget(
      rating: "4.5",
      image: "assets/images/top_rated2.png",
      ingredients: "100 gr meat + onion + tomato + Lettuce cheese",
      name: "Cheese burger",
      price: "\$15.00",
    ),
    TopRatedWidget(
      rating: "3.8",
      image: "assets/images/top_rated1.png",
      name: "Chicken burger",
      ingredients: "100 gr chicken + tomato + cheese Lettuce",
      price: "\$20.00",
    ),
  ];

  final List<RecommendItemWidget> recommendedItems = [
    RecommendItemWidget(image: "assets/images/recomended1.png", price: "103.0"),
    RecommendItemWidget(image: "assets/images/recomended2.png", price: "50.0"),
    RecommendItemWidget(image: "assets/images/recmended3.png", price: "12.99"),
    RecommendItemWidget(image: "assets/images/recomended4.png", price: "8.20"),
  ];

  List<FoodItemWidget> pizza = [
    FoodItemWidget(
      title: "Mexican Green Wave",
      description: "A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes",
      price: "\$23",
      imageUrl: "assets/images/pizza1.png",
    ),
    FoodItemWidget(
      title: "Peppy Paneer",
      description: "Chunky paneer with crisp capsicum and spicy red pepper, and spicy red pepper",
      price: "\$13",
      imageUrl: "assets/images/pizza2.png",
    ),
    FoodItemWidget(
      title: "Pepperoni pizza",
      description: "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
      price: "\$29",
      imageUrl: "assets/images/pizza3.png",
    ),
    FoodItemWidget(
      title: "Pizza Cheese",
      description: "Food pizza dish cuisine junk food, Fast Food, Flatbread, Ingredient",
      price: "\$23",
      imageUrl: "assets/images/pizza4.png",
    ),

  ];

  List<FoodItemWidget> burger = [
    FoodItemWidget(
      title: "Cheeseburger",
      description: "Juicy beef patty with cheddar, lettuce, tomato, pickles, and onion rings",
      price: "\$20",
      imageUrl: "assets/images/top_rated1.png",
    ),
    FoodItemWidget(
      title: "BBQ Bacon Burger",
      description: "Grilled beef patty topped with crispy bacon, BBQ sauce, and onion rings",
      price: "\$15",
      imageUrl: "assets/images/burger3.png",
    ),
    FoodItemWidget(
      title: "Veggie Burger",
      description: "Black bean and quinoa patty with avocado and cilantro-lime mayo on",
      price: "\$23",
      imageUrl: "assets/images/veggie.png",
    ),
    FoodItemWidget(
      title: "Chicken Burger",
      description: "Crispy fried chicken with buffalo sauce and blue cheese on a potato bun.",
      price: "\$25",
      imageUrl: "assets/images/top_rated2.png",
    ),

  ];

  List<FoodItemWidget> sandwich = [
    FoodItemWidget(
      title: "Chicken Taco",
      description: "Soft tortilla with grilled chicken, guacamole, cheese, and tomatoes.",
      price: "\$20",
      imageUrl: "assets/images/sandwich 3.png",
    ),
    FoodItemWidget(
      title: "Hot Dog Trio",
      description: "Three juicy grilled hot dogs topped with mustard, ketchup, onions, and relish",
      price: "\$45",
      imageUrl: "assets/images/sandwich 4.png",
    ),
    FoodItemWidget(
      title: "Cheese Sandwich",
      description: "A hearty sandwich featuring layers of savory ham, melted cheese, fresh lettuce.",
      price: "\$23",
      imageUrl: "assets/images/sandwich 1.png",
    ),
    FoodItemWidget(
      title: "Croissant Sandwich",
      description: "A flaky croissant filled with thinly sliced ham, creamy cheese, and fresh greens.",
      price: "\$25",
      imageUrl: "assets/images/sandwich 2.png",
    ),

  ];

  final List<NotificationItem> _notifications = [
    NotificationItem(
      title: "Delayed Order",
      message: "We're sorry! Your order is running late. New ETA: 10:30 PM.",
      date: "Last Wednesday at 9:42 AM",
      isError: true,
      isRead: false,
    ),
    NotificationItem(
      title: "Promotional Offer",
      message: "Get 20% off on your next order. Code: YUMMY20.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: false,
    ),
    NotificationItem(
      title: "Out for Delivery",
      message: "Your order is on the way! Estimated arrival: 15 mins.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: true,
    ),
    NotificationItem(
      title: "Order Confirmation",
      message: "Your order has been placed! We're preparing it now.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: true,
    ),
    NotificationItem(
      title: "Delivered",
      message: "Enjoy your meal! Your order has been delivered.",
      date: "Last Wednesday at 9:42 AM",
      isError: false,
      isRead: true,
    ),
  ];



  void updateSelectedToggleIndex(int index) {
    if (selectedToggleIndex != index) {
      selectedToggleIndex = index;
      notifyListeners();
    }
  }

  List<NotificationItem> getFilteredNotifications() {
    switch (selectedToggleIndex) {
      case 0:
        return _notifications;
      case 1:
        return _notifications.where((n) => !n.isRead).toList();
      case 2:
        return _notifications.where((n) => n.isRead).toList();
      default:
        return _notifications;
    }
  }

  void updateSelectedIndex(int index) {
    if (selectedIndex != index) {
      selectedIndex = index;
      notifyListeners();
    }
  }
}