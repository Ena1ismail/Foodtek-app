import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/model/food_item.dart';
import 'package:foodtek/view/widgets/cart_widgets/check_out_widget.dart';
import 'package:provider/provider.dart';
import '../../controller/cart_controller.dart';
import '../../view/widgets/cart_widgets/cart_item_widget.dart';
import '../../view/widgets/cart_widgets/empty_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Consumer<CartController>(
                builder: (context, cartController, child) {
                  final cartItems = cartController.cartItems;

                  if (cartItems.isEmpty) {
                    return EmptyWidget(
                      title: "Cart Empty",
                      subTitle: "You don’t have added any foods in the cart at this time.",
                    );
                  } else {
                    return ListView(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                          child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final foodItem = cartItems[index];
                              return CartItemWidget(foodItem: foodItem);
                            },
                          ),
                        ),
                        CheckOutWidget(),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}