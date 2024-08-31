import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCounterIcon extends StatelessWidget {
  const TCounterIcon({
    super.key,
    required this.onPressed,
    this.iconColor,
    this.icon = Iconsax.shopping_bag,
  });
  final VoidCallback onPressed;
  final Color? iconColor;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Stack(
      children: [
        IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: iconColor,
            )),
        Positioned(
            right: 0,
            child: Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: dark ? TColors.white : TColors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Text('2',
                    style: Theme.of(context).textTheme.labelLarge!.apply(
                        color: dark ? TColors.black : TColors.white,
                        fontSizeFactor: 0.8)),
              ),
            ))
      ],
    );
  }
}
