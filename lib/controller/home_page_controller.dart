import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:foodtek/view/widgets/custom_button_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model/notification_item.dart';
import '../view/widgets/home_widgets/food_item_widget.dart';
import '../view/widgets/home_widgets/recommend_item_widget.dart';
import '../view/widgets/home_widgets/top_rated_widget.dart';

class HomePageController extends ChangeNotifier {
  TextEditingController searchTextEditingController = TextEditingController();
  int selectedIndex = 0;
  int selectedToggleIndex = 0;
  String selectedCategory = "All";
  late FoodItem foodItem;
  int itemAmount = 0;
  double sliderValue = 4.0;
  List<FoodItem> fav = [];

  bool isProductDetailsSelected = false;


  toggleProductDetails(){
    isProductDetailsSelected = !isProductDetailsSelected;
    notifyListeners();
  }

  selectedFoodItem(FoodItem item){
    foodItem = item;
    notifyListeners();
  }

  bool isFavourite(FoodItem foodItem) {
    return fav.contains(foodItem);
  }

  void toggleFavourite(BuildContext context, FoodItem foodItem) {
    if (fav.contains(foodItem)) {
      _showConfirmationDialog(context, foodItem);
    } else {
      fav.add(foodItem);
      notifyListeners();
    }
  }

  void updateSliderValue(double newValue) {
    if (sliderValue != newValue) {
      sliderValue = newValue;
      notifyListeners();
    }
  }


  void updateSelectedCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      notifyListeners();
    }
  }

  List<FoodItemWidget> getItemsForCategory() {
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
      foodItem: FoodItem(
        name: "Chicken burger",
        rating: 5,
        reviews: 78,
        imageUrl: "assets/images/top_rated1.png",
        description: "100 gr chicken + tomato + cheese Lettuce",
        newPrice: 20.00,
        oldPrice: 23.00,
      ),
    ),
    TopRatedWidget(
      foodItem: FoodItem(
        name: "Cheese burger",
        rating: 4.5,
        reviews: 35,
        imageUrl: "assets/images/top_rated2.png",
        description: "100 gr meat + onion + tomato + Lettuce cheese",
        newPrice: 15.00,
        oldPrice: 18.00,
      ),
    ),
    TopRatedWidget(
      foodItem: FoodItem(
        name: "Chicken burger",
        rating: 3.8,
        reviews: 76,
        imageUrl: "assets/images/top_rated1.png",
        description: "100 gr chicken + tomato + cheese Lettuce",
        newPrice: 20.00,
        oldPrice: 24.00,
      ),
    ),
    TopRatedWidget(
      foodItem: FoodItem(
        name: "Cheese burger",
        rating: 4.5,
        reviews: 67,
        imageUrl: "assets/images/top_rated2.png",
        description: "100 gr meat + onion + tomato + Lettuce cheese",
        newPrice: 15.00,
        oldPrice: 17.00,
      ),
    ),
    TopRatedWidget(
      foodItem: FoodItem(
        name: "Chicken burger",
        rating: 3.8,
        reviews: 66,
        imageUrl: "assets/images/top_rated1.png",
        description: "100 gr chicken + tomato + cheese Lettuce",
        newPrice: 20.00,
        oldPrice: 16.00,
      ),
    ),
  ];

  final List<RecommendItemWidget> recommendedItems = [
    RecommendItemWidget(
      foodItem: FoodItem(
        imageUrl: "assets/images/recommend1.png",
        newPrice: 103.0,
        oldPrice: 120.0,

      ),
    ),
    RecommendItemWidget(
      foodItem: FoodItem(
        imageUrl: "assets/images/recommend2.png",
        newPrice: 50.0,
      ),
    ),
    RecommendItemWidget(
      foodItem: FoodItem(
        imageUrl: "assets/images/recommend3.png",
        newPrice: 12.99,
      ),
    ),
    RecommendItemWidget(
      foodItem: FoodItem(
        imageUrl: "assets/images/recommend4.png",
        newPrice: 8.20,
      ),
    ),
  ];

  List<FoodItemWidget> pizza = [
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Mexican Green Wave",
        description:
            "A pizza loaded with crunchy onions, crisp capsicum, juicy tomatoes",
        newPrice: 23.00,
        oldPrice: 30.00,
        imageUrl: "assets/images/pizza1.png",
        rating: 3.5,
        reviews: 98,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Peppy Paneer",
        description:
            "Chunky paneer with crisp capsicum and spicy red pepper, and spicy red pepper",
        newPrice: 13.00,
        oldPrice: 17.00,
        imageUrl: "assets/images/pizza2.png",
        rating: 4.5,
        reviews: 39,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Pepperoni pizza",
        description:
            "Pepperoni pizza, Margarita Pizza Margherita Italian cuisine Tomato",
        newPrice: 29.00,
        oldPrice: 35.00,
        imageUrl: "assets/images/pizza3.png",
        rating: 4,
        reviews: 94,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Pizza Cheese",
        description:
            "Food pizza dish cuisine junk food, Fast Food, Flatbread, Ingredient",
        newPrice: 23,
        oldPrice: 29.00,
        imageUrl: "assets/images/pizza4.png",
        rating: 5,
        reviews: 22,
      ),
    ),
  ];

  List<FoodItemWidget> burger = [
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Cheese Burger",
        description:
            "Juicy beef patty with cheddar, lettuce, tomato, pickles, and onion rings",
        newPrice: 20,
        oldPrice: 27.00,
        imageUrl: "assets/images/top_rated1.png",
        rating: 3.5,
        reviews: 67,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "BBQ Bacon Burger",
        description:
            "Grilled beef patty topped with crispy bacon, BBQ sauce, and onion rings",
        newPrice: 15,
        oldPrice: 17.00,
        imageUrl: "assets/images/burger3.png",
        rating: 5,
        reviews: 120,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Veggie Burger",
        description:
            "Black bean and quinoa patty with avocado and cilantro-lime mayo on",
        newPrice: 23,
        oldPrice: 27.00,
        imageUrl: "assets/images/veggie.png",
        rating: 5,
        reviews: 32,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Chicken Burger",
        description:
            "Crispy fried chicken with buffalo sauce and blue cheese on a potato bun.",
        newPrice: 25,
        oldPrice: 29.00,
        imageUrl: "assets/images/top_rated2.png",
        rating: 3.5,
        reviews: 98,
      ),
    ),
  ];

  List<FoodItemWidget> sandwich = [
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Chicken Taco",
        description:
            "Soft tortilla with grilled chicken, guacamole, cheese, and tomatoes.",
        newPrice: 20,
        oldPrice: 24.00,
        imageUrl: "assets/images/sandwich 3.png",
        rating: 3.5,
        reviews: 60,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Hot Dog Trio",
        description:
            "Three juicy grilled hot dogs topped with mustard, ketchup, onions, and relish",
        newPrice: 45,
        oldPrice: 55.00,
        imageUrl: "assets/images/sandwich 4.png",
        rating: 4.5,
        reviews: 70,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Cheese Sandwich",
        description:
            "A hearty sandwich featuring layers of savory ham, melted cheese, fresh lettuce.",
        newPrice: 23,
        oldPrice: 28.00,
        imageUrl: "assets/images/sandwich 1.png",
        rating: 3,
        reviews: 89,
      ),
    ),
    FoodItemWidget(
      foodItem: FoodItem(
        name: "Croissant Sandwich",
        description:
            "A flaky croissant filled with thinly sliced ham, creamy cheese, and fresh greens.",
        newPrice: 25,
        oldPrice: 30.00,
        imageUrl: "assets/images/sandwich 2.png",
        rating: 4,
        reviews: 98,
      ),
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

  void incrementItemAmount() {
    itemAmount++;
    notifyListeners();
  }

  void decrementItemAmount() {
    if (itemAmount > 0) {
      itemAmount--;
      notifyListeners();
    }
  }

  void _showConfirmationDialog(BuildContext context, FoodItem foodItem) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Text(
            textAlign: TextAlign.center,
            "Are you sure you want to remove it from favorites?",
            style: GoogleFonts.inter(fontSize: 14.sp, color: Colors.black54, fontWeight: FontWeight.w400),
          ),
          actions: [
            CustomButtonWidget(
              title: "Yes",
              colors: [AppConstants.buttonColor, AppConstants.buttonColor],
              height: 60.h,
              borderRadius: 12.r,
              titleColor: Colors.white,
              width: 300.w,
              onPressed: () {
                fav.remove(foodItem);
                notifyListeners();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
