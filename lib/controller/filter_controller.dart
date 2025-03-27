import 'package:flutter/cupertino.dart';

class FilterController extends ChangeNotifier{
  TextEditingController maxPriceController = TextEditingController();
  TextEditingController minPriceController = TextEditingController();

  TextEditingController maxDiscountController = TextEditingController();
  TextEditingController minDiscountController = TextEditingController();

  double sliderPriceValue = 4.0;
  double sliderDiscountValue = 4.0;

  int selectedCategoryIndex = 0;
  int selectedLocationIndex = 0;
  int selectedDishIndex = 0;
  String selectedCategory = "Fast Food";
  String selectedLocation = "1 KM";
  String selectedDish = "Tuna Tartare";



  void updateSelectedCategory(String category) {
    if (selectedCategory != category) {
      selectedCategory = category;
      notifyListeners();
    }
  }


  void updateSelectedLocation(String category) {
    if (selectedLocation != category) {
      selectedLocation = category;
      notifyListeners();
    }
  }

  void updateSelectedDish(String category) {
    if (selectedDish != category) {
      selectedDish = category;
      notifyListeners();
    }
  }


  void updateSelectedCategoryIndex(int index) {
    if (selectedCategoryIndex != index) {
      selectedCategoryIndex = index;
      notifyListeners();
    }
  }


  void updateSelectedLocationIndex(int index) {
    if (selectedLocationIndex != index) {
      selectedLocationIndex = index;
      notifyListeners();
    }
  }

  void updateSelectedDishIndex(int index) {
    if (selectedDishIndex != index) {
      selectedDishIndex = index;
      notifyListeners();
    }
  }


  void updateSliderPriceValue(double newValue) {
    if (sliderPriceValue != newValue) {
      sliderPriceValue = newValue;
      notifyListeners();
    }
  }

  void updateSliderDiscountValue(double newValue) {
    if (sliderDiscountValue != newValue) {
      sliderDiscountValue = newValue;
      notifyListeners();
    }
  }
}
