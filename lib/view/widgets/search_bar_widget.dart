import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/input_widget.dart';
import 'package:foodtek/controller/home_page_controller.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          InputWidget(
            borderRadius: 40.r,
            width: 370.w,
            height: 55.h,
            borderColor: Color(0xFFD6D6D6),
            borderSide: BorderSide(color: Colors.transparent),
            textEditingController: context.read<HomePageController>().searchTextEditingController,
            obscureText: false,
            prefixIcon: Icon(Icons.search, color: Color(0xFF878787)),
            backgroundColor: Colors.white,
            hintText: "Search menu, restaurant or etc",
            hintColor: Color(0xFF878787),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/filter.png",
                height: 18.h,
                width: 18.w,
              ),
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }
}