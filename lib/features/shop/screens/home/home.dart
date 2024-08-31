import 'package:appecomm/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:appecomm/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:appecomm/common/widgets/layouts/grid_layout.dart';
import 'package:appecomm/common/widgets/products/product_cards/product.dart';
import 'package:appecomm/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:appecomm/common/widgets/texts/section_heading.dart';
import 'package:appecomm/features/shop/screens/home/widgets/home_appBar.dart';
import 'package:appecomm/features/shop/screens/home/widgets/home_category.dart';
import 'package:appecomm/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:appecomm/utils/constants/colors.dart';
import 'package:appecomm/utils/constants/image_strings.dart';
import 'package:appecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(children: [
                THomeAppBar(),
                SizedBox(height: TSizes.spaceBtwSections),
                TSearchContainer(
                  text: 'Search in Store',
                ),
                SizedBox(height: TSizes.spaceBtwSections),
                Padding(
                  padding: EdgeInsets.only(left: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      TSectionsHeading(
                        textColor: TColors.white,
                        title: 'Popular Categories',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      THomeCategory()
                    ],
                  ),
                )
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace / 3),
              child: Column(
                children: [
                  TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3
                    ],
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TSectionsHeading(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(product: products[index]);
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
