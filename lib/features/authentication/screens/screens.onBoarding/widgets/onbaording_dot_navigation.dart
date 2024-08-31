import 'package:appecomm/features/authentication/controllers/controllers.onboarding/controllers.onboarding.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/device/device_utilities.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingDotNaviagtion extends StatelessWidget {
  const OnBoardingDotNaviagtion({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: TSizes.defaultSpace,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.doNavigationClick,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: dark ? TColors.light : TColors.dark,
            dotHeight: 6,
          ),
        ));
  }
}
