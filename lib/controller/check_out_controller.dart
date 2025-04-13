import 'package:flutter/material.dart';

import '../view/screens/cart_screens/add_card_screen.dart';
import '../view/screens/cart_screens/check_out_successfully_screen.dart';

class CheckOutController with ChangeNotifier {
  String selectedPaymentMethod = "card";

  void setSelectedPaymentMethod(String method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }

  String selectedCardType = "Visa";

  void setSelectedCardType(String type) {
    selectedCardType = type;
    notifyListeners();
  }

  String promoCode = "";

  void setPromoCode(String code) {
    promoCode = code;
    notifyListeners();
  }

  void navigateToNextScreen(BuildContext context) {
    if (selectedPaymentMethod == "cash") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CheckOutSuccessfullyScreen()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddCardScreen()),
      );
    }
  }
}