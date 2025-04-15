import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodtek/l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../controller/login_controller.dart';
import '../input_widget.dart';

class EmailFieldWidget extends StatelessWidget {
  final LoginController loginController;

  const EmailFieldWidget({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return Selector<LoginController, String?>(
      selector: (context, loginController) => loginController.errors['email'],
      builder: (context, errorText, _) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.email,
              style: GoogleFonts.plusJakartaSans(
                color: Color(0xFF6C7278),
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            InputWidget(
              backgroundColor: Colors.white,
              borderColor: Color(0xFFEFF0F6),
              textEditingController: loginController.emailController,
              obscureText: false,
              keyboardType: TextInputType.emailAddress,
              hintText: "demo@demo.com",
              onChanged:
                  (value) => loginController.validateField(
                    field: 'email',
                    value: value,
                    context: context,
                  ),
              errorText: errorText,
            ),
          ],
        );
      },
    );
  }
}
