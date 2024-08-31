import 'package:appecomm/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/image_text_widget/vertical_image_text.dart';

class THomeCategory extends StatelessWidget {
  const THomeCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return TVerticalImageText(
              image: TImages.cosmetics,
              title: 'Cosmetics',
              onTap: () {},
            );
          }),
    );
  }
}
