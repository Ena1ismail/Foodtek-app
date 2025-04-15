import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/app_constants.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:foodtek/view/widgets/custom_button_widget.dart';
import 'package:foodtek/view/widgets/home_widgets/search_bar_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import '../../app_styles.dart';
import '../../controller/lang_controller.dart';
import '../widgets/home_widgets/counter_buttons_widget.dart';

class ProductDetailsWidget extends StatefulWidget {
  final FoodItem foodItem;

  const ProductDetailsWidget({super.key, required this.foodItem});

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  late FoodItem _foodItem;

  @override
  void initState() {
    super.initState();
    _foodItem = widget.foodItem.copyWith(quantity: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SearchBarWidget(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderImage(),
                  SizedBox(height: 24.h),
                  _buildFoodName(),
                  SizedBox(height: 8.h),
                  _buildRatingAndReviews(),
                  SizedBox(height: 16.h),
                  _buildPrice(),
                  SizedBox(height: 24.h),
                  _buildDescription(),
                  SizedBox(height: 24.h),
                  _buildCustomizationOptions(context),
                  SizedBox(height: 32.h),
                  _buildAddToCartButton(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderImage() {
    return Container(
      height: 200.h,
      width: 370.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.jpeg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Center(
        child: Image.asset(
          _foodItem.imageUrl ?? "assets/images/apple.png",
          height: 150.h,
          width: 200.w,
        ),
      ),
    );
  }

  Widget _buildFoodName() {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Text(
      _foodItem.name ?? "name",
      style: AppStyles.getFontStyle(
        langController,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }

  Widget _buildRatingAndReviews() {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RatingBar(
          itemSize: 20,
          initialRating: _foodItem.rating ?? 1,
          minRating: 0,
          maxRating: 5,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ignoreGestures: true,
          unratedColor: Colors.white,
          itemPadding: EdgeInsets.only(right: 2.w),
          ratingWidget: RatingWidget(
            full: Icon(Icons.star, color: Color(0xFFFFC107)),
            half: Icon(Icons.star_half, color: Color(0xFFFFC107)),
            empty: Icon(Icons.star_border, color: Color(0xFFFFC107)),
          ),
          onRatingUpdate: (rating) {},
        ),
        Text(
          " ${_foodItem.rating.toString()}",
          style: AppStyles.getFontStyle(
            langController,
            color: Color(0xFF838383),
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          " (${_foodItem.reviews.toString()} ${AppLocalizations.of(context)!.reviews})",
          style: AppStyles.getFontStyle(
            langController,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: Color(0xFF838383),
          ),
        ),
      ],
    );
  }

  Widget _buildPrice() {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "\$${_foodItem.newPrice.toString()}",
          style: AppStyles.getFontStyle(
            langController,
            color: AppConstants.buttonColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(width: 8.w),
        Text(
          "\$${_foodItem.oldPrice.toString()}",
          style: AppStyles.getFontStyle(
            langController,
            color: Color(0xFF838383),
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            decoration: TextDecoration.lineThrough,
          ),
        ),
      ],
    );
  }

  Widget _buildDescription() {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Text(
      "${_foodItem.description ?? "des"} ${_foodItem.description ?? "des"}",
      style: AppStyles.getFontStyle(
        langController,
        fontSize: 12.sp,
        color: Color(0xFF838383),
      ),
    );
  }

  Widget _buildCustomizationOptions(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_buildSpicyLevel(context), _buildQuantitySelector(context)],
      ),
    );
  }

  Widget _buildSpicyLevel(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.spicy,
          style: AppStyles.getFontStyle(
            langController,
            fontSize: 12.sp,
            color: Color(0xFF838383),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 170.w,
          child: Consumer<HomePageController>(
            builder: (context, homePageController, child) {
              return SfSlider(
                min: 0,
                max: 10.0,
                value: homePageController.sliderValue,
                showLabels: true,
                labelFormatterCallback: (
                  dynamic actualValue,
                  String formattedText,
                ) {
                  return actualValue <= 5
                      ? AppLocalizations.of(context)!.mild
                      : AppLocalizations.of(context)!.hot;
                },
                inactiveColor: Color(0xFFF3F4F6),
                activeColor: Color(0xFFEF2A39),
                onChanged: (dynamic newValue) {
                  homePageController.updateSliderValue(newValue);
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.quantity,
          style: AppStyles.getFontStyle(
            langController,
            fontSize: 12.sp,
            color: Color(0xFF838383),
          ),
        ),
        SizedBox(height: 15.h),
        SizedBox(
          width: 150.w,
          child: Consumer<CartController>(
            builder: (context, cartController, child) {
              return CounterButtonsWidget(
                value: _foodItem.quantity ?? 1,
                onIncrement: () => cartController.incrementItem(_foodItem),
                onDecrement:
                    () => cartController.decrementItem(_foodItem, context),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return Consumer<CartController>(
      builder: (context, cartController, child) {
        bool isInCart = cartController.cartItems.any(
          (item) => item.id == _foodItem.id,
        );
        return Consumer<HomePageController>(
          builder: (context, homePageController, child) {
            return Center(
              child: CustomButtonWidget(
                title:
                    isInCart
                        ? AppLocalizations.of(context)!.update_cart
                        : AppLocalizations.of(context)!.add_to_cart,
                colors: [AppConstants.buttonColor, AppConstants.buttonColor],
                borderRadius: 12.r,
                titleColor: Colors.white,
                height: 50.h,
                width: 330.w,
                onPressed: () {
                  if (isInCart) {
                    final existingItem = cartController.cartItems.firstWhere(
                      (item) => item.id == _foodItem.id,
                    );
                    existingItem.quantity =
                        (existingItem.quantity ?? 0) +
                        (_foodItem.quantity ?? 1);
                    cartController.notifyListeners();
                  } else {
                    cartController.addItem(_foodItem);
                  }
                  homePageController.toggleProductDetails();
                  homePageController.selectedFoodItem(_foodItem);
                },
              ),
            );
          },
        );
      },
    );
  }
}
