import 'package:appecomm/common/widgets/sucess_screen/sucess_screen.dart';
import 'package:appecomm/features/authentication/screens/login/login.dart';
import 'package:appecomm/navigation_menu.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/image_strings.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => LoginScreen()),
              icon: Icon(
                Iconsax.close_square,
                color: dark ? TColors.white : TColors.black,
              )),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: AssetImage(TImages.email),
                width: THelperFunctions.ScreenWidth() * 0.6,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => SuccessScreen(
                            image: TImages.success,
                            title: TTexts.yourAccountCreatedTitle,
                            subtitle: TTexts.yourAccountCreatedSubTitle,
                            onPressed: () => Get.to(() => NavigationMenu()),
                          )),
                      child: Text(TTexts.tContinue))),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
