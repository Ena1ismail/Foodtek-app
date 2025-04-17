import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import '../app_constants.dart';
import '../model/food_item.dart';
import '../view/widgets/custom_button_widget.dart';

class CartController extends ChangeNotifier {
  final List<FoodItem> cartItems = [];
  final List<FoodItem> historyOrders = [
    FoodItem(
      imageUrl: "assets/images/recommend1.png",
      newPrice: 103.0,
      oldPrice: 120.0,
      name: "Chicken burger",
      rating: 3.8,
      reviews: 66,
      quantity: 1,
      category: "cate",
      id: 1,
      ingredients: "ing",
      description: "100 gr chicken + tomato + cheese Lettuce",
    ),
    FoodItem(
      imageUrl: "assets/images/recommend1.png",
      newPrice: 103.0,
      oldPrice: 120.0,
      name: "Chicken burger",
      rating: 3.8,
      reviews: 66,
      quantity: 1,
      category: "cate",
      id: 1,
      ingredients: "ing",
      description: "100 gr chicken + tomato + cheese Lettuce",
    ),
  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController expiryController = TextEditingController();
  TextEditingController cvcController = TextEditingController();



  removeFromHistory(FoodItem foodItem){
    historyOrders.remove(foodItem);
    notifyListeners();
  }

  void addItem(FoodItem foodItem) {
    if (cartItems.contains(foodItem)) {
      incrementItem(foodItem);
      notifyListeners();
    } else {
      cartItems.add(foodItem);
      notifyListeners();
    }
  }

  void removeItem(FoodItem foodItem) {
    cartItems.remove(foodItem);
    notifyListeners();
  }

  void incrementItem(FoodItem foodItem) {
    final item = foodItem;
    item.quantity = (item.quantity ?? 0) + 1;
    notifyListeners();
  }

  void decrementItem(FoodItem foodItem, BuildContext context) {
    final item = foodItem;

    if ((item.quantity ?? 0) > 1) {
      item.quantity = (item.quantity ?? 0) - 1;
    } else {
      _showConfirmationDialog(context, foodItem.id ?? 0);
    }
    notifyListeners();
  }

  double calculateSubTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += (item.newPrice ?? 0) * (item.quantity ?? 0);
    }
    return total;
  }

  void _showConfirmationDialog(BuildContext context, int itemId) {
    final item = cartItems.firstWhere((item) => item.id == itemId);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Text(
            textAlign: TextAlign.center,
            AppLocalizations.of(context)!.remove_item,
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: Colors.black54,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: [
            CustomButtonWidget(
              title: AppLocalizations.of(context)!.yes,
              colors: [AppConstants.buttonColor, AppConstants.buttonColor],
              height: 60.h,
              borderRadius: 12.r,
              titleColor: Colors.white,
              width: 300.w,
              onPressed: () {
                cartItems.remove(item);
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
