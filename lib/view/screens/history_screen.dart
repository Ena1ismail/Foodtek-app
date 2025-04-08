import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/cart_controller.dart';
import 'package:foodtek/view/widgets/cart_widgets/empty_widget.dart';
import 'package:foodtek/view/widgets/cart_widgets/history_widget.dart';
import 'package:provider/provider.dart';


class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<CartController>(
        builder: (context, cartController, child) {
          if (cartController.historyOrders.isEmpty) {
            return EmptyWidget(
              title: "History Empty",
              subTitle: "You don’t have order any foods before",
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 420.h,
                      child: ListView.builder(
                        itemCount: cartController.historyOrders.length,
                        itemBuilder: (context, index) {
                          final foodItem = cartController.historyOrders[index];
                          return HistoryWidget(foodItem: foodItem);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
