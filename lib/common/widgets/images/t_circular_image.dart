import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.boxfit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.overLayColor,
    this.bakgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = TSizes.sm,
  });
  final BoxFit? boxfit;
  final String image;
  final bool isNetworkImage;
  final Color? overLayColor;
  final Color? bakgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
          color: bakgroundColor ??
              (THelperFunctions.isDarkMode(context)
                  ? TColors.black
                  : TColors.white),
          borderRadius: BorderRadius.circular(100)),
      child: Image(
        fit: boxfit,
        image: isNetworkImage
            ? NetworkImage(image)
            : AssetImage(image) as ImageProvider,
        color: overLayColor,
      ),
    );
  }
}
