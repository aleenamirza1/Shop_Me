import 'package:appecomm/features/authentication/controllers/controllers.onboarding/controllers.onboarding.dart';
import 'package:appecomm/features/authentication/screens/screens.onBoarding/widgets/onbaording_dot_navigation.dart';
import 'package:appecomm/features/authentication/screens/screens.onBoarding/widgets/onboarding_next_button.dart';
import 'package:appecomm/features/authentication/screens/screens.onBoarding/widgets/onboarding_page.dart';
import 'package:appecomm/features/authentication/screens/screens.onBoarding/widgets/onboarding_skip.dart';
import 'package:appecomm/utils/constants/image_strings.dart';
import 'package:appecomm/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  final controller = Get.put(OnBoardingController());
  OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              )
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingDotNaviagtion(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
