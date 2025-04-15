import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../l10n/app_localizations.dart';
import 'chat_widget.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24, right: 24, top: 25),
            child: Column(
              children: [
                SizedBox(height: 35.h),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      AppLocalizations.of(context)!.chat,
                      style: TextStyle(
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
                        hintText: AppLocalizations.of(context)!.write_your_message,
                        hintStyle: TextStyle(color: Color(0xffA1A1A1)),
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
      floatingActionButton: Transform.translate(
        offset: Offset(0, 10),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 65.w,
              height: 65.h,
              decoration: BoxDecoration(
                color: Color(0xffDBF4D1),
                shape: BoxShape.circle,
                boxShadow: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
