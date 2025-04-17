import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/check_out_controller.dart';
import 'package:provider/provider.dart';

import '../app_styles.dart';
import '../controller/lang_controller.dart';
import '../l10n/app_localizations.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40,left: 30,right: 30),
          child: Column(
            children: [
              SizedBox(height: 8.h),
              Row(
                children: [
<<<<<<< HEAD
                  //SizedBox(width: 10.w),
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
=======
                  SizedBox(width: 15.w),
                  Consumer<CheckOutController>(builder: (context, checkOutController, child) {
                    return IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        checkOutController.toggleProfileScreen();
                      },
                    );
                  },),
>>>>>>> 50fc8217a6fc04c41690d90822e460ee8fff5b13
                  Text(
                    AppLocalizations.of(context)!.profile,
                    style: AppStyles.getFontStyle(
                      langController,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("assets/images/man2.png"),
              ),
              SizedBox(height: 8.h),
              Text(
                AppLocalizations.of(context)!.ahmad_daboor,
                style: AppStyles.getFontStyle(
                  langController,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ahmad1709@gmail.com',
                style: AppStyles.getFontStyle(
                  langController,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.all(10),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 0.8, color: Color(0xffFFFFFF)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.username,
                      style: AppStyles.getFontStyle(
                        langController,
                        color: Color(0xff6C7278),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: double.infinity,
                      height: 46.h,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          hintText: "Ahmad Daboor",
                          hintStyle: AppStyles.getFontStyle(
                            langController,
                            fontSize: 14,
                            color: Color(0xff1A1C1E),
                            fontWeight: FontWeight.w500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1.w,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppLocalizations.of(context)!.email,
                      style: AppStyles.getFontStyle(
                        langController,
                        color: Color(0xff6C7278),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 356.w,
                      height: 46.h,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "Loisbecket@gmail.com",
                          hintStyle: AppStyles.getFontStyle(
                            langController,
                            fontSize: 14,
                            color: Color(0xff1A1C1E),
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                              width: 1,
                            ), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppLocalizations.of(context)!.phone_number,
                      style: AppStyles.getFontStyle(
                        langController,
                        color: Color(0xff6C7278),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 356.w,
                      height: 46.h,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "0797653948",
                          hintStyle: AppStyles.getFontStyle(
                            langController,
                            fontSize: 14,
                            color: Color(0xff1A1C1E),
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                              width: 1,
                            ), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppLocalizations.of(context)!.password,
                      style: AppStyles.getFontStyle(
                        langController,
                        color: Color(0xff6C7278),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 356.w,
                      height: 46.h,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "******************",
                          hintStyle: AppStyles.getFontStyle(
                            langController,
                            fontSize: 14,
                            color: Color(0xff1A1C1E),
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                              width: 1,
                            ), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      AppLocalizations.of(context)!.address,
                      style: AppStyles.getFontStyle(
                        langController,
                        color: Color(0xff6C7278),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    SizedBox(
                      width: 356.w,
                      height: 46.h,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          constraints: BoxConstraints(minHeight: 30),
                          hintText: "123 Al-Madina Street, Abdali, A",
                          hintStyle: AppStyles.getFontStyle(
                            langController,
                            fontSize: 14,
                            color: Color(0xff1A1C1E),
                            fontWeight: FontWeight.w500,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade300,
                              width: 1,
                            ), // حواف فاتحة
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Colors.grey.shade500,
                              width: 1,
                            ), // حواف عند التركيز
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),

              SizedBox(height: 30.h),
              Center(
                child: SizedBox(
                  width: 295.w,
                  height: 60.h,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff25AE4B),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.update,
                          style: AppStyles.getFontStyle(
                            langController,
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}