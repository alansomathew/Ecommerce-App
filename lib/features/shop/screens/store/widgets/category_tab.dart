import 'package:ecommerce_app/common/widgets/brands/brand_show_case.dart';
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/porduct_card_vertical.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //* Brands
              const BrandShowCase(
                images: [
                  TImages.productImage3,
                  TImages.productImage4,
                  TImages.productImage5,
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              //* Products
              SectionHeading(
                title: 'You Might Like',
                onPressed: () {},
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              GridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ],
    );
  }
}
