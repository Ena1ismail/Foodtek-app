import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/controller/check_out_controller.dart';
import 'package:provider/provider.dart';
import '../app_styles.dart';
import '../controller/lang_controller.dart';
import '../l10n/app_localizations.dart';
import '../view/widgets/main_widgets/main_bottom_navigation_bar.dart';
import 'chat_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    LangController langController = Provider.of<LangController>(
      context,
      listen: false,
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 25),
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Consumer<CheckOutController>(builder: (context, checkOutController, child) {
                      return IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          checkOutController.toggleChatScreen();
                        },
                      );
                    },),
                    Text(
                      AppLocalizations.of(context)!.chat,
                      style: AppStyles.getFontStyle(
                        langController,
                        fontSize: 20.sp,
                        color: Color(0xff391713),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                PreferredSize(
                  preferredSize: Size.fromHeight(1),
                  child: Container(color: Color(0xffECECEC), height: 1.h),
                ),
                Expanded(
                  child: ChatViewWidget(
                    messages: [
                      " Hello chatGPT,how are you today?",
                      "There are many programming languages \n​​in the market that are used in designing \n and building websites, various\n applications and other tasks. All these \n languages ​​are popular in their place and \n in the way they are used, and many \n programmers learn and use them.",
                      "So explain to me more",
                      "There are many programming languages \n​​in the market that are used in designing \n and building websites, various\n applications and other tasks. All these \n languages ​​are popular in their place and \n in the way they are used, and many \n programmers learn and use them.",
                      "What is the best programming language?",
                      "Hello,i’m fine,how can i help you?",
                      "Hello chatGPT,how are you today?",
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: 30,
            right: 24,
            child: Container(
              width: 333.w,
              height: 56.h,
              decoration: BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText:
                            AppLocalizations.of(context)!.write_your_message,
                        hintStyle: AppStyles.getFontStyle(
                          langController,
                          color: Color(0xffA1A1A1),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send, color: Color(0xff25AE4B)),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
<<<<<<< HEAD

=======
>>>>>>> 50fc8217a6fc04c41690d90822e460ee8fff5b13
    );
  }
}
