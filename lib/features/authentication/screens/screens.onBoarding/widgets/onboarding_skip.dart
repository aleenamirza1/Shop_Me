import 'package:appecomm/features/authentication/controllers/controllers.onboarding/controllers.onboarding.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/device/device_utilities.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () => OnBoardingController.instance.skipPage(),
          child: const Text("Skip"),
        ));
  }
}
