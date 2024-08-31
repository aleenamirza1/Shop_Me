import 'package:appecomm/common/widgets/widget_login_signup/form_divider.dart';
import 'package:appecomm/common/widgets/widget_login_signup/social_buttons.dart';
import 'package:appecomm/features/authentication/screens/signup/signup_widget/tSignUp_form.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpScreen extends StatelessWidget {
  final VoidCallback? onTap;

  const SignUpScreen({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: onTap,
            icon: Icon(
              Iconsax.backward,
              color: dark ? TColors.white : TColors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signUpTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSignUpForm(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSocilaButtons()
            ],
          ),
        ),
      ),
    );
  }
}
