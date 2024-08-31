import 'package:appecomm/utils/constants/image_strings.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.center,
          child: Image(
              height: 180,
              image: AssetImage(
                  dark ? TImages.lightAppLogo : TImages.darkApplogo)),
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        SizedBox(height: TSizes.sm),
        Text(
          TTexts.loginSubTitle,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
