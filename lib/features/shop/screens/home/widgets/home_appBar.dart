import 'package:appecomm/common/widgets/appbar/appbar.dart';
import 'package:appecomm/common/widgets/products/cart/cartScreen.dart';
import 'package:appecomm/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:appecomm/features/authentication/screens/login/login.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:appecomm/utils/validators/authservice.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });
  void logout(BuildContext context) async {
    final _auth = AuthService();
    await _auth.signOut();
    Get.offAll(() => LoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(TTexts.homeAppBarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: TColors.white)),
          Text(TTexts.homeAppBarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: TColors.white))
        ],
      ),
      actions: [
        TCounterIcon(
            onPressed: () {
              Get.to(CartScreen());
            },
            iconColor: TColors.white),
        TCounterIcon(
          onPressed: () {
            logout(context);
          },
          icon: Icons.logout,
        )
      ],
    );
  }
}
