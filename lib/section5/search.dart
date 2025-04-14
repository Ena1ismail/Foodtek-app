import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: 327.w,
        height: 42.h,
        child: SearchAnchor(
          builder:
              (context, controller) => SearchBar(
                controller: searchController,
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 16),
                ),

                hintText: "Find your location",
                hintStyle: MaterialStateProperty.all(
                  TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff878787),
                  ),
                ),
                leading: Icon(Icons.search, color: Color(0xff25AE4B)),
                backgroundColor: MaterialStateProperty.all(
                  Color(0xffFFFFFF),
                ),
                onChanged: (query) {},
              ),
          suggestionsBuilder: (context, query) {
            return [];
          },
        ),
      ),
    );
  }
}
