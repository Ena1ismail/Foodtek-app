import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @onboarding_title1.
  ///
  /// In en, this message translates to:
  /// **'welcome to sahlah'**
  String get onboarding_title1;

  /// No description provided for @onboarding_subtitle1.
  ///
  /// In en, this message translates to:
  /// **'enjoy a fast and smooth food delivery at your doorstep'**
  String get onboarding_subtitle1;

  /// No description provided for @onboarding_title2.
  ///
  /// In en, this message translates to:
  /// **'get delivery on time '**
  String get onboarding_title2;

  /// No description provided for @onboarding_subtitle2.
  ///
  /// In en, this message translates to:
  /// **'order your favorite food within the\nplam of your hand and the zone\nof your comfort'**
  String get onboarding_subtitle2;

  /// No description provided for @onboarding_title3.
  ///
  /// In en, this message translates to:
  /// **'choose your food'**
  String get onboarding_title3;

  /// No description provided for @onboarding_subtitle3.
  ///
  /// In en, this message translates to:
  /// **'order your favorite food within the\nplam of your hand and the zone\nof your comfort'**
  String get onboarding_subtitle3;

  /// No description provided for @onboarding_title4.
  ///
  /// In en, this message translates to:
  /// **'turn on your location'**
  String get onboarding_title4;

  /// No description provided for @onboarding_subtitle4.
  ///
  /// In en, this message translates to:
  /// **'to continues, let your device turn \non location, which uses google’s\nlocation service'**
  String get onboarding_subtitle4;

  /// No description provided for @continue_to.
  ///
  /// In en, this message translates to:
  /// **'continue'**
  String get continue_to;

  /// No description provided for @skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get skip;

  /// No description provided for @yes_turn_it_on.
  ///
  /// In en, this message translates to:
  /// **'yes, turn it on'**
  String get yes_turn_it_on;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'cancel'**
  String get cancel;

  /// No description provided for @continue_with_google.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continue_with_google;

  /// No description provided for @continue_with_facebook.
  ///
  /// In en, this message translates to:
  /// **'Continue with Facebook'**
  String get continue_with_facebook;

  /// No description provided for @continue_with_apple.
  ///
  /// In en, this message translates to:
  /// **'Continue with Apple'**
  String get continue_with_apple;

  /// No description provided for @remove_from_favorites_confirmation.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove it from favorites?'**
  String get remove_from_favorites_confirmation;

  /// No description provided for @forget_password.
  ///
  /// In en, this message translates to:
  /// **'Forget Password ?'**
  String get forget_password;

  /// No description provided for @signup_title.
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get signup_title;

  /// No description provided for @login_title.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login_title;

  /// No description provided for @signup_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get signup_subtitle;

  /// No description provided for @login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Don’t have an account?'**
  String get login_subtitle;

  /// No description provided for @full_name.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get full_name;

  /// No description provided for @full_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get full_name_hint;

  /// No description provided for @date_of_birth.
  ///
  /// In en, this message translates to:
  /// **'Birth of date'**
  String get date_of_birth;

  /// No description provided for @select_date.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get select_date;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phone_number;

  /// No description provided for @phone_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number.'**
  String get phone_error;

  /// No description provided for @self_password.
  ///
  /// In en, this message translates to:
  /// **'Set Password'**
  String get self_password;

  /// No description provided for @register_button.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register_button;

  /// No description provided for @remember_me.
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get remember_me;

  /// No description provided for @reset_password_title.
  ///
  /// In en, this message translates to:
  /// **'Rest Password'**
  String get reset_password_title;

  /// No description provided for @reset_password_instruction.
  ///
  /// In en, this message translates to:
  /// **'Enter your E-mail or phone and we\'ll \nsend you a link to get back into\nyour account  '**
  String get reset_password_instruction;

  /// No description provided for @send_button.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get send_button;

  /// No description provided for @verification_code_instruction.
  ///
  /// In en, this message translates to:
  /// **'A 4-digit code has been sent to your email. Please enter it to verify.'**
  String get verification_code_instruction;

  /// No description provided for @verify_button.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get verify_button;

  /// No description provided for @otp_error.
  ///
  /// In en, this message translates to:
  /// **'Please enter the full OTP code.'**
  String get otp_error;

  /// No description provided for @new_password.
  ///
  /// In en, this message translates to:
  /// **'New Password'**
  String get new_password;

  /// No description provided for @confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm New Password'**
  String get confirm_password;

  /// No description provided for @confirm_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Confirm your new password'**
  String get confirm_password_hint;

  /// No description provided for @update_password_button.
  ///
  /// In en, this message translates to:
  /// **'Update Password'**
  String get update_password_button;

  /// No description provided for @congratulations.
  ///
  /// In en, this message translates to:
  /// **'Congratulations!'**
  String get congratulations;

  /// No description provided for @password_reset_success.
  ///
  /// In en, this message translates to:
  /// **'password reset successfully'**
  String get password_reset_success;

  /// No description provided for @error_message.
  ///
  /// In en, this message translates to:
  /// **'Please fix the errors before proceeding.'**
  String get error_message;

  /// No description provided for @password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your password'**
  String get password_hint;

  /// No description provided for @new_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Enter your new password'**
  String get new_password_hint;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'Something Went wrong'**
  String get something_went_wrong;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @current_password.
  ///
  /// In en, this message translates to:
  /// **'Want to try with your current password? '**
  String get current_password;

  /// No description provided for @passwords_error.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match.'**
  String get passwords_error;

  /// No description provided for @update_cart.
  ///
  /// In en, this message translates to:
  /// **'Update Cart'**
  String get update_cart;

  /// No description provided for @remove_from_cart.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove it from Carts?'**
  String get remove_from_cart;

  /// No description provided for @current_location.
  ///
  /// In en, this message translates to:
  /// **'Current location'**
  String get current_location;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search menu, restaurant or etc'**
  String get search_hint;

  /// No description provided for @no_notification.
  ///
  /// In en, this message translates to:
  /// **'No notifications to display.'**
  String get no_notification;

  /// No description provided for @remove_item.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove it from Carts?'**
  String get remove_item;

  /// No description provided for @all_category.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all_category;

  /// No description provided for @burger_category.
  ///
  /// In en, this message translates to:
  /// **'Burger'**
  String get burger_category;

  /// No description provided for @pizza_category.
  ///
  /// In en, this message translates to:
  /// **'Pizza'**
  String get pizza_category;

  /// No description provided for @sandwich_category.
  ///
  /// In en, this message translates to:
  /// **'ٍSandwich'**
  String get sandwich_category;

  /// No description provided for @top_rated.
  ///
  /// In en, this message translates to:
  /// **'Top Rated'**
  String get top_rated;

  /// No description provided for @recommend.
  ///
  /// In en, this message translates to:
  /// **'Recommend'**
  String get recommend;

  /// No description provided for @view_all.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get view_all;

  /// No description provided for @order_now.
  ///
  /// In en, this message translates to:
  /// **'Order Now'**
  String get order_now;

  /// No description provided for @price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get price;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @all_tab.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all_tab;

  /// No description provided for @unread_tab.
  ///
  /// In en, this message translates to:
  /// **'Unread'**
  String get unread_tab;

  /// No description provided for @read_tab.
  ///
  /// In en, this message translates to:
  /// **'Read'**
  String get read_tab;

  /// No description provided for @favorites.
  ///
  /// In en, this message translates to:
  /// **'favorites'**
  String get favorites;

  /// No description provided for @no_favorites.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet!'**
  String get no_favorites;

  /// No description provided for @are_you_sure_remove_from_favorites.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to remove it from favorites?'**
  String get are_you_sure_remove_from_favorites;

  /// No description provided for @yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get yes;

  /// No description provided for @price_range.
  ///
  /// In en, this message translates to:
  /// **'Price Range'**
  String get price_range;

  /// No description provided for @min.
  ///
  /// In en, this message translates to:
  /// **'Min'**
  String get min;

  /// No description provided for @max.
  ///
  /// In en, this message translates to:
  /// **'Max'**
  String get max;

  /// No description provided for @discount.
  ///
  /// In en, this message translates to:
  /// **'Discount'**
  String get discount;

  /// No description provided for @category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get category;

  /// No description provided for @location.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get location;

  /// No description provided for @dish.
  ///
  /// In en, this message translates to:
  /// **'Dish'**
  String get dish;

  /// No description provided for @add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add To Cart'**
  String get add_to_cart;

  /// No description provided for @spicy.
  ///
  /// In en, this message translates to:
  /// **'Spicy'**
  String get spicy;

  /// No description provided for @mild.
  ///
  /// In en, this message translates to:
  /// **'Mild'**
  String get mild;

  /// No description provided for @hot.
  ///
  /// In en, this message translates to:
  /// **'Hot'**
  String get hot;

  /// No description provided for @quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get quantity;

  /// No description provided for @reviews.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get reviews;

  /// No description provided for @filter.
  ///
  /// In en, this message translates to:
  /// **'Filter'**
  String get filter;

  /// No description provided for @cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get cart;

  /// No description provided for @history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get history;

  /// No description provided for @subtotal.
  ///
  /// In en, this message translates to:
  /// **'Sub-Total'**
  String get subtotal;

  /// No description provided for @delivery_charge.
  ///
  /// In en, this message translates to:
  /// **'Delivery Charge'**
  String get delivery_charge;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @place_my_order.
  ///
  /// In en, this message translates to:
  /// **'Place My Order'**
  String get place_my_order;

  /// No description provided for @cart_empty.
  ///
  /// In en, this message translates to:
  /// **'Cart Empty'**
  String get cart_empty;

  /// No description provided for @cart_empty_prompt.
  ///
  /// In en, this message translates to:
  /// **'You don’t have add any foods in cart at this time '**
  String get cart_empty_prompt;

  /// No description provided for @history_empty.
  ///
  /// In en, this message translates to:
  /// **'History Empty'**
  String get history_empty;

  /// No description provided for @history_empty_prompt.
  ///
  /// In en, this message translates to:
  /// **'You don’t have order any foods before'**
  String get history_empty_prompt;

  /// No description provided for @load_more.
  ///
  /// In en, this message translates to:
  /// **'Load More..'**
  String get load_more;

  /// No description provided for @reorder.
  ///
  /// In en, this message translates to:
  /// **'Reorder'**
  String get reorder;

  /// No description provided for @add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get add;

  /// No description provided for @aleksandr_v.
  ///
  /// In en, this message translates to:
  /// **'Aleksandr V.'**
  String get aleksandr_v;

  /// No description provided for @change.
  ///
  /// In en, this message translates to:
  /// **'Change'**
  String get change;

  /// No description provided for @enter_your_promo.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Promo'**
  String get enter_your_promo;

  /// No description provided for @your_location.
  ///
  /// In en, this message translates to:
  /// **'your location'**
  String get your_location;

  /// No description provided for @set_location.
  ///
  /// In en, this message translates to:
  /// **'Set Location'**
  String get set_location;

  /// No description provided for @checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout;

  /// No description provided for @pay_with.
  ///
  /// In en, this message translates to:
  /// **'Pay With:'**
  String get pay_with;

  /// No description provided for @pay_for_order.
  ///
  /// In en, this message translates to:
  /// **'Pay for the order'**
  String get pay_for_order;

  /// No description provided for @promo_code.
  ///
  /// In en, this message translates to:
  /// **'Promo Code?'**
  String get promo_code;

  /// No description provided for @add_card.
  ///
  /// In en, this message translates to:
  /// **'Add Card'**
  String get add_card;

  /// No description provided for @card.
  ///
  /// In en, this message translates to:
  /// **'Card'**
  String get card;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @card_type.
  ///
  /// In en, this message translates to:
  /// **'Card Type:'**
  String get card_type;

  /// No description provided for @visa.
  ///
  /// In en, this message translates to:
  /// **'VISA'**
  String get visa;

  /// No description provided for @mastercard.
  ///
  /// In en, this message translates to:
  /// **'Master Card'**
  String get mastercard;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @card_number.
  ///
  /// In en, this message translates to:
  /// **'Card Number'**
  String get card_number;

  /// No description provided for @enter_card_number.
  ///
  /// In en, this message translates to:
  /// **'Enter Card Number'**
  String get enter_card_number;

  /// No description provided for @expiry_date.
  ///
  /// In en, this message translates to:
  /// **'Expiry'**
  String get expiry_date;

  /// No description provided for @cvc.
  ///
  /// In en, this message translates to:
  /// **'CVC'**
  String get cvc;

  /// No description provided for @order_done_successfully.
  ///
  /// In en, this message translates to:
  /// **'Your Order Done Successfully'**
  String get order_done_successfully;

  /// No description provided for @you_will_get_your_order_within_12min.
  ///
  /// In en, this message translates to:
  /// **'you will get your order within 12min.'**
  String get you_will_get_your_order_within_12min;

  /// No description provided for @thanks_for_using_our_services.
  ///
  /// In en, this message translates to:
  /// **'thanks for using our services'**
  String get thanks_for_using_our_services;

  /// No description provided for @track_your_order.
  ///
  /// In en, this message translates to:
  /// **'track Your Order'**
  String get track_your_order;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @loc.
  ///
  /// In en, this message translates to:
  /// **'123 Al-Madina Street, Abdali, Amman, Jordan'**
  String get loc;

  /// No description provided for @order_id.
  ///
  /// In en, this message translates to:
  /// **' Order ID'**
  String get order_id;

  /// No description provided for @ahmad_daboor.
  ///
  /// In en, this message translates to:
  /// **'Ahmad Daboor'**
  String get ahmad_daboor;

  /// No description provided for @no_points_found_in_polyline_result.
  ///
  /// In en, this message translates to:
  /// **'No points found in polyline result'**
  String get no_points_found_in_polyline_result;

  /// No description provided for @location_services_are_disabled.
  ///
  /// In en, this message translates to:
  /// **'Location services are disabled.'**
  String get location_services_are_disabled;

  /// No description provided for @location_permissions_are_denied.
  ///
  /// In en, this message translates to:
  /// **'Location permissions are denied'**
  String get location_permissions_are_denied;

  /// No description provided for @location_permissions.
  ///
  /// In en, this message translates to:
  /// **'Location permissions are permanently denied, we cannot request permissions.'**
  String get location_permissions;

  /// No description provided for @successful_payment.
  ///
  /// In en, this message translates to:
  /// **'We will send you an order details to your email after the successful payment'**
  String get successful_payment;

  /// No description provided for @empty_fields.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all the fields'**
  String get empty_fields;

  /// No description provided for @invalid_card_number.
  ///
  /// In en, this message translates to:
  /// **'Invalid card number'**
  String get invalid_card_number;

  /// No description provided for @invalid_date.
  ///
  /// In en, this message translates to:
  /// **'Invalid expiry date'**
  String get invalid_date;

  /// No description provided for @invalid_cvc.
  ///
  /// In en, this message translates to:
  /// **'Invalid CVC'**
  String get invalid_cvc;

  /// No description provided for @new_address.
  ///
  /// In en, this message translates to:
  /// **'New Address'**
  String get new_address;

  /// No description provided for @chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat;

  /// No description provided for @write_your_message.
  ///
  /// In en, this message translates to:
  /// **'Write your message'**
  String get write_your_message;

  /// No description provided for @your_delivery_hero.
  ///
  /// In en, this message translates to:
  /// **'Your Delivery Hero'**
  String get your_delivery_hero;

  /// No description provided for @order_details.
  ///
  /// In en, this message translates to:
  /// **'order Details'**
  String get order_details;

  /// No description provided for @on_the_way.
  ///
  /// In en, this message translates to:
  /// **'On The Way'**
  String get on_the_way;

  /// No description provided for @order_received.
  ///
  /// In en, this message translates to:
  /// **'Order received '**
  String get order_received;

  /// No description provided for @cooking_your_order.
  ///
  /// In en, this message translates to:
  /// **'Cooking your order '**
  String get cooking_your_order;

  /// No description provided for @courier_is_picking_up_order.
  ///
  /// In en, this message translates to:
  /// **'Courier is picking up order'**
  String get courier_is_picking_up_order;

  /// No description provided for @order_delivered.
  ///
  /// In en, this message translates to:
  /// **'Order delivered'**
  String get order_delivered;

  /// No description provided for @live_track.
  ///
  /// In en, this message translates to:
  /// **'Live Track'**
  String get live_track;

  /// No description provided for @my_account.
  ///
  /// In en, this message translates to:
  /// **'My Account'**
  String get my_account;

  /// No description provided for @personal_information.
  ///
  /// In en, this message translates to:
  /// **'Personal information'**
  String get personal_information;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacy_policy;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Setting'**
  String get settings;

  /// No description provided for @push_notifications.
  ///
  /// In en, this message translates to:
  /// **'Push Notifications'**
  String get push_notifications;

  /// No description provided for @promotional_notifications.
  ///
  /// In en, this message translates to:
  /// **'Promotional Notifications'**
  String get promotional_notifications;

  /// No description provided for @more.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get more;

  /// No description provided for @help_center.
  ///
  /// In en, this message translates to:
  /// **'Help Center'**
  String get help_center;

  /// No description provided for @log_out.
  ///
  /// In en, this message translates to:
  /// **'Log Out'**
  String get log_out;

  /// No description provided for @find_your_location.
  ///
  /// In en, this message translates to:
  /// **'Find your location'**
  String get find_your_location;

  /// No description provided for @all_details.
  ///
  /// In en, this message translates to:
  /// **'all details'**
  String get all_details;

  /// No description provided for @order_placed.
  ///
  /// In en, this message translates to:
  /// **'Order Placed'**
  String get order_placed;

  /// No description provided for @delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivered;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'profile'**
  String get profile;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get username;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get address;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get update;

  /// No description provided for @enter_name.
  ///
  /// In en, this message translates to:
  /// **'Enter name'**
  String get enter_name;

  /// No description provided for @area.
  ///
  /// In en, this message translates to:
  /// **'Area'**
  String get area;

  /// No description provided for @building_name.
  ///
  /// In en, this message translates to:
  /// **'Building name'**
  String get building_name;

  /// No description provided for @apt_number.
  ///
  /// In en, this message translates to:
  /// **'Apt. number'**
  String get apt_number;

  /// No description provided for @floor.
  ///
  /// In en, this message translates to:
  /// **'Floor'**
  String get floor;

  /// No description provided for @street.
  ///
  /// In en, this message translates to:
  /// **'Street'**
  String get street;

  /// No description provided for @additional_directions.
  ///
  /// In en, this message translates to:
  /// **'Additional directions (optional)'**
  String get additional_directions;

  /// No description provided for @save_address.
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get save_address;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get ok;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
