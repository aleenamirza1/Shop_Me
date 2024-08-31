import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    this.backgroundColor,
  });
  final void Function()? onTap;
  final String image, title;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            Container(
                width: 56,
                height: 56,
                padding: EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                    color: TColors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                  child: Image(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                      color: TColors.dark),
                )),
            SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: TColors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ))
          ],
        ),
      ),
    );
  }
}
