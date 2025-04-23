import 'package:flutter/cupertino.dart';

import '../l10n/app_localizations.dart';

class FilterController extends ChangeNotifier {
  final TextEditingController minPriceController = TextEditingController();
  final TextEditingController maxPriceController = TextEditingController();
  final TextEditingController minDiscountController = TextEditingController();
  final TextEditingController maxDiscountController = TextEditingController();

  double sliderPriceValue = 4.0;
  double sliderDiscountValue = 4.0;

  int selectedCategoryIndex = 0;
  int selectedLocationIndex = 0;
  int selectedDishIndex = 0;
  String selectedCategory = "Fast Food";
  String selectedLocation = "1 KM";
  String selectedDish = "Tuna Tartare";



  void updateSelected(String type, String value, int index, BuildContext context) {
    if (type == AppLocalizations.of(context)!.category && selectedCategory != value) {
      selectedCategory = value;
      selectedCategoryIndex = index;
    } else if (type == AppLocalizations.of(context)!.location && selectedLocation != value) {
      selectedLocation = value;
      selectedLocationIndex = index;
    } else if (type == AppLocalizations.of(context)!.dish && selectedDish != value) {
      selectedDish = value;
      selectedDishIndex = index;
    } else {
      return;
    }
    notifyListeners();
  }

  void updateSlider(String type, double newValue, BuildContext context) {
    if (type == AppLocalizations.of(context)!.price && sliderPriceValue != newValue) {
      sliderPriceValue = newValue;
    } else if (type == AppLocalizations.of(context)!.discount && sliderDiscountValue != newValue) {
      sliderDiscountValue = newValue;
    } else {
      return;
    }
    notifyListeners();
  }
}