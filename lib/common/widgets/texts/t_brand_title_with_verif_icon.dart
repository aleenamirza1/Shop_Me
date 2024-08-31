import 'package:appecomm/common/widgets/texts/t_brand_title_text.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/enums.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TBrandTitleWithVerifcationIcon extends StatelessWidget {
  const TBrandTitleWithVerifcationIcon({
    super.key,
    required this.title,
    this.maxlines = 1,
    this.textColor,
    this.iconColor = TColors.primary,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSizes.small,
  });
  final String title;
  final int maxlines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: BrandTitleText(
          title: title,
          color: textColor,
          maxlines: maxlines,
          textAlign: textAlign,
          brandTextSize: brandTextSize,
        )),
        const SizedBox(width: TSizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: TSizes.iconXs)
      ],
    );
  }
}
