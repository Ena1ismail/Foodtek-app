import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: Consumer<CartController>(
          builder: (context, cartController, _) {
            final historyOrders = cartController.historyOrders;

            if (historyOrders.isEmpty) {
              return EmptyWidget(
                title: "History Empty",
                subTitle: "You haven’t ordered any foods before.",
              );
            }

            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: historyOrders.length,
                      itemBuilder: (context, index) {
                        final foodItem = historyOrders[index];
                        return HistoryWidget(foodItem: foodItem);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
