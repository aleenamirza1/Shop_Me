import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/device/device_utilities.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TTapBar extends StatelessWidget implements PreferredSizeWidget {
  const TTapBar({
    super.key,
    required this.tabs,
  });
  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Material(
      color: dark ? TColors.black : TColors.white,
      child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          unselectedLabelColor: TColors.darkGrey,
          labelColor: THelperFunctions.isDarkMode(context)
              ? TColors.white
              : TColors.primary,
          tabs: tabs),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
