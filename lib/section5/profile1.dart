import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/check_out_controller.dart';
import 'package:foodtek/section5/profile2.dart';
import 'package:foodtek/theme/Data_screen.dart';
import 'package:foodtek/view/screens/registration_screens/login_screen.dart';
import 'package:provider/provider.dart';

import '../app_styles.dart';
import '../controller/lang_controller.dart';
import '../l10n/app_localizations.dart';

class Prof extends StatefulWidget {
  const Prof({super.key});

  @override
  State<Prof> createState() => _ProfState();
}

class _ProfState extends State<Prof> {
  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    return Consumer<CheckOutController>(
      builder: (context, checkOutController, child) {
        if (checkOutController.isProfile2) {
          return Profile();
        } else {
          return Scaffold(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            appBar: AppBar(
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              toolbarHeight: 30.h,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        AppLocalizations.of(context)!.profile,
                        style: AppStyles.getFontStyle(
                          langController,
                          fontSize: 20.sp,
                          color: isDarkMode ? Colors.white : Color(0xff391713),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage("assets/images/man2.png"),
                        ),
                        SizedBox(height: 7.h),
                        Text(
                          AppLocalizations.of(context)!.ahmad_daboor,
                          style: AppStyles.getFontStyle(
                            langController,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          'ahmad1709@gmail.com',
                          style: AppStyles.getFontStyle(
                            langController,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Container(
                          width: 380.w,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.my_account,
                                style: AppStyles.getFontStyle(
                                  langController,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(height: 16.h),
                              GestureDetector(
                                onTap: () {
                                  checkOutController.toggleProfileScreen();
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person_add_alt_1_sharp,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.personal_information,
                                      style: AppStyles.getFontStyle(
                                        langController,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10.h),

                              GestureDetector(
                                onTap: () {
                                  final langController =
                                      Provider.of<LangController>(
                                        context,
                                        listen: false,
                                      );

                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor:
                                            Theme.of(
                                              context,
                                            ).scaffoldBackgroundColor,

                                        title: Text(
                                          AppLocalizations.of(
                                            context,
                                          )!.language,
                                          style: AppStyles.getFontStyle(
                                            langController,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                'عربية',
                                                style: AppStyles.getFontStyle(
                                                  langController,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).primaryColor,
                                                ),
                                              ),
                                              onTap: () {
                                                langController.changeLang(
                                                  langCode: 'ar',
                                                );
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                            ListTile(
                                              title: Text(
                                                'English',
                                                style: AppStyles.getFontStyle(
                                                  langController,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.w500,
                                                  color:
                                                      Theme.of(
                                                        context,
                                                      ).primaryColor,
                                                ),
                                              ),
                                              onTap: () {
                                                langController.changeLang(
                                                  langCode: 'en',
                                                );
                                                Navigator.of(
                                                  context,
                                                ).pop(); // Close the dialog
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.language,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      AppLocalizations.of(context)!.language,
                                      style: AppStyles.getFontStyle(
                                        langController,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    Spacer(),
                                    Consumer<LangController>(
                                      builder: (
                                        context,
                                        langController,
                                        child,
                                      ) {
                                        return Text(
                                          langController.currentLangCode == 'ar'
                                              ? "عربية"
                                              : "English",
                                          style: AppStyles.getFontStyle(
                                            langController,
                                            color: Color(0xFF838383),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 11.h),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.privacy_tip,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      AppLocalizations.of(
                                        context,
                                      )!.privacy_policy,
                                      style: AppStyles.getFontStyle(
                                        langController,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 11.h),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DataScreen(),
                                    ),
                                  );
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.settings,
                                      size: 20,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      AppLocalizations.of(context)!.settings,
                                      style: AppStyles.getFontStyle(
                                        langController,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 380.w,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.notifications,
                                style: AppStyles.getFontStyle(
                                  langController,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(height: 5.h),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  buildRow(
                                    AppLocalizations.of(
                                      context,
                                    )!.push_notifications,
                                    true,
                                    context,
                                  ),
                                  buildRow(
                                    AppLocalizations.of(
                                      context,
                                    )!.promotional_notifications,
                                    false,
                                    context,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          width: 380.w,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.more,
                                style: AppStyles.getFontStyle(
                                  langController,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.help_outline,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 10.w),
                                    Text(
                                      AppLocalizations.of(context)!.help_center,
                                      style: AppStyles.getFontStyle(
                                        langController,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.logout,
                                      color: Color(0xffDC1010),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => LoginScreen(),
                                          ),
                                          (route) => false,
                                        );
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)!.log_out,
                                        style: AppStyles.getFontStyle(
                                          langController,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xffDC1010),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildRow(String title, bool isActive, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.notifications_none_outlined,
              color: Theme.of(context).primaryColor,
            ),
            SizedBox(width: 10.w),
            Text(title),
          ],
        ),
        Transform.scale(
          scale: 0.8,
          child: CupertinoSwitch(value: isActive, onChanged: (bool val) {}),
        ),
      ],
    );
  }
}
