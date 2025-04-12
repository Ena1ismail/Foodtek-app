import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/view/screens/filter_search_screen.dart';
import 'package:foodtek/view/widgets/input_widget.dart';
import 'package:provider/provider.dart';
import '../../../controller/home_page_controller.dart';

class SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homePageController = Provider.of<HomePageController>(
      context,
      listen: false,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 20),
          InputWidget(
            borderRadius: BorderRadius.circular(40.r),
            width: 370,
            height: 55,
            borderColor: Color(0xFFD6D6D6),
            borderSide: BorderSide(color: Colors.transparent),
            textEditingController:
                homePageController.searchTextEditingController,
            obscureText: false,
            prefixIcon: Icon(Icons.search, color: Color(0xFF878787)),
            backgroundColor: Colors.white,
            hintText: "Search menu, restaurant or etc",
            hintColor: Color(0xFF878787),
            suffixIcon: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilterSearchScreen()),
                );
              },
              icon: Image.asset(
                "assets/images/filter.png",
                height: 18,
                width: 18,
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}
