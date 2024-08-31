import 'package:appecomm/common/styles/spacing_style.dart';
import 'package:appecomm/common/widgets/widget_login_signup/form_divider.dart';
import 'package:appecomm/common/widgets/widget_login_signup/social_buttons.dart';
import 'package:appecomm/features/authentication/screens/login/login_widgets/login_form.dart';
import 'package:appecomm/features/authentication/screens/login/login_widgets/login_header.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback? onTap;

  const LoginScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingwithAppBarHeight,
          child: Column(
            children: [
              TLoginHeader(),
              TLoginForm(onTap: onTap),
              TFormDivider(
                dividerText: TTexts.orSignInWith.capitalize!,
              ),
              SizedBox(height: TSizes.spaceBtwSections / 2),
              TSocilaButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
