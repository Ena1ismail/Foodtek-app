import 'package:flutter/material.dart';
import 'package:foodtek/l10n/app_localizations.dart';

import '../view/screens/cart_screens/add_card_screen.dart';
import '../view/screens/cart_screens/check_out_successfully_screen.dart';

class CheckOutController with ChangeNotifier {
  String? selectedPaymentMethod;
  String? selectedCardType;

  String promoCode = "";

  String getSelectedPaymentMethod(BuildContext context) {
    return selectedPaymentMethod ?? AppLocalizations.of(context)!.card;
  }

  String getSelectedCardType(BuildContext context) {
    return selectedCardType ?? AppLocalizations.of(context)!.visa;
  }

  void setSelectedPaymentMethod(String method) {
    selectedPaymentMethod = method;
    notifyListeners();
  }

  void setSelectedCardType(String type) {
    selectedCardType = type;
    notifyListeners();
  }

  void setPromoCode(String code) {
    promoCode = code;
    notifyListeners();
  }

  void navigateToNextScreen(BuildContext context) {
    if (selectedPaymentMethod == AppLocalizations.of(context)!.cash) {
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