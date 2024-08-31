import 'package:appecomm/common/widgets/appbar/appbar.dart';
import 'package:appecomm/common/widgets/appbar/t_TabBar.dart';
import 'package:appecomm/common/widgets/custom_shapes/containers/RoundedContainer.dart';
import 'package:appecomm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:appecomm/common/widgets/images/t_circular_image.dart';
import 'package:appecomm/common/widgets/layouts/grid_layout.dart';
import 'package:appecomm/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:appecomm/common/widgets/texts/section_heading.dart';
import 'package:appecomm/common/widgets/texts/t_brand_title_with_verif_icon.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/enums.dart';
import 'package:appecomm/utils/constants/image_strings.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:appecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          appBar: TAppBar(
            title: Text(
              'Store',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            actions: [
              TCounterIcon(
                onPressed: () {},
                iconColor: dark ? TColors.white : TColors.black,
              )
            ],
          ),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  floating: true,
                  backgroundColor: THelperFunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(height: TSizes.spaceBtwItems),
                        TSearchContainer(
                          text: 'Search in Store',
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwSections,
                        ),
                        TSectionsHeading(
                          title: 'Favorite Brands',
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems / 1.5,
                        ),
                        TGridLayout(
                            mainAxisEntent: 80,
                            itemCount: 4,
                            itemBuilder: (_, index) {
                              return GestureDetector(
                                onTap: () {},
                                child: TRoundedContainer(
                                  padding: EdgeInsets.all(TSizes.sm),
                                  showBorder: true,
                                  backgorundColor: Colors.transparent,
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: TCircularImage(
                                            isNetworkImage: false,
                                            image: TImages.tailersDummy,
                                            bakgroundColor: Colors.transparent,
                                            overLayColor:
                                                THelperFunctions.isDarkMode(
                                                        context)
                                                    ? TColors.white
                                                    : TColors.black),
                                      ),
                                      SizedBox(
                                        width: TSizes.spaceBtwItems / 2,
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            TBrandTitleWithVerifcationIcon(
                                              title: 'Nike',
                                              brandTextSize: TextSizes.large,
                                            ),
                                            Text(
                                              '256 Products',
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  ),
                  bottom: TTapBar(
                    tabs: [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furniture')),
                      Tab(child: Text('Electronics')),
                      Tab(child: Text('Clothes')),
                      Tab(child: Text('Cosmetics'))
                    ],
                  ),
                ),
              ];
            },
            body: Container(),
          )),
    );
  }
}
