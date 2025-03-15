import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class InputWidget extends StatelessWidget {
  final TextEditingController textEditingController;
  final String? label;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? hintText;
  final String? errorText;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final Color backgroundColor;
  final Color borderColor;
  final Color labelColor;
  final double? width;
  final double? fontSize;
  final double? borderRadius;
  final double? height;
  final Color? hintColor;

  const InputWidget(
      {super.key,
        required this.textEditingController,
        this.label,
        required this.obscureText,
        this.prefixIcon,
        this.suffixIcon,
        this.hintText,
        this.errorText,
        this.onChanged,
        this.keyboardType,
        this.backgroundColor = const Color(0xFFECF0F6),
        this.borderColor = Colors.transparent,
        this.labelColor = const Color(0xFFBBBFC5),
        this.width,
        this.height,
        this.fontSize,
        this.borderRadius,
        this.hintColor});

  @override
  Widget build(BuildContext context) {

    return Container(
      height: 46.h,
      width: 295.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.black12,
        //     blurRadius: .3,
        //     offset: Offset(0, 1.5),
        //   ),
        // ],
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1.w,
        ),
      ),
      child: TextField(
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        obscureText: obscureText,
        controller: textEditingController,
        maxLines: 1,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: labelColor,
            fontSize: fontSize ?? 14.sp,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: fontSize ?? 14.sp,
            color: hintColor ?? Color(0xFFBBBFC5),
            fontWeight: FontWeight.w500,
          ),
          errorText: errorText,
          border: InputBorder.none,
          // Avoid overlapping borders
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:test_sales/app_styles.dart';
// import 'package:test_sales/controller/lang_controller.dart';
//
// class InputWidget extends StatelessWidget {
//   TextEditingController textEditingController;
//   String label;
//   bool obscureText;
//   String? errorText;
//   String? hintText;
//   Widget prefixIcon;
//   Widget? suffixIcon;
//   Function(String)? onChanged;
//   TextInputType? keyboardType;
//   Color backgroundColor;
//   Color borderColor;
//   Color labelColor;
//   double? width;
//   double? fontSize;
//   double? borderRadius;
//
//   InputWidget({
//     super.key,
//     required this.textEditingController,
//     required this.obscureText,
//     required this.prefixIcon,
//     required this.label,
//     this.suffixIcon,
//     this.hintText,
//     this.errorText,
//     this.onChanged,
//     this.keyboardType,
//     this.backgroundColor = const Color(0xFFECF0F6),
//     this.borderColor = Colors.transparent,
//     this.labelColor = const Color(0xFFBBBFC5),
//     this.width,
//     this.fontSize,
//     this.borderRadius
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final langController = Provider.of<LangController>(context);
//     return Container(
//       height: 50,
//       width: width ?? double.infinity,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(40),
//         color: backgroundColor,
//         border: Border.all(
//           color: borderColor,
//           width: .5,
//         ),
//       ),
//       child: TextField(
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         controller: textEditingController,
//         maxLines: 1,
//         decoration: InputDecoration(
//           label: Text(
//             label,
//             style: AppStyles.getFontStyle(
//               langController,
//               color: labelColor,
//               fontSize: fontSize ?? 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           prefixIcon: prefixIcon,
//           suffixIcon: suffixIcon,
//           hintText: hintText,
//           hintStyle: AppStyles.getFontStyle(
//             langController,
//             fontSize: fontSize ?? 14,
//             color: Color(0xFFBBBFC5),
//             fontWeight: FontWeight.w500,
//           ),
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(
//                 borderRadius ?? 40,
//               ),
//               borderSide: BorderSide.none),
//           errorText: errorText,
//         ),
//         onChanged: onChanged,
//       ),
//     );
//   }
// }
