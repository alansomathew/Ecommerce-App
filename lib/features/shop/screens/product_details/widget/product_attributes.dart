import 'package:ecommerce_app/common/widgets/chips/choice_chip.dart';
import 'package:ecommerce_app/common/widgets/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/common/widgets/texts/product_title_text.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        //* Selected Attribute Pricing & description
        RoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              //* Title Price and Stock status
              Row(
                children: [
                  const SectionHeading(
                    title: 'Variations',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Price : ',
                            smallSize: true,
                          ),

                          //* Actual Price
                          Text(
                            '\u{20B9} 25',
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                          const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),

                          //* Sale Price
                          const ProductPriceText(price: '20')
                        ],
                      ),
                      //* Stock
                      Row(
                        children: [
                          const ProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              //* variation description
              const ProductTitleText(
                title:
                    'This is the Description of the product and it can go up to max 4 lines',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        //* Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Colors',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        //* Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeading(
              title: 'Sizes',
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: 'S', selected: true, onSelected: (value) {}),
                TChoiceChip(text: 'M', selected: false, onSelected: (value) {}),
                TChoiceChip(text: 'L', selected: false, onSelected: (value) {}),
              ],
            )
          ],
        ),
      ],
    );
  }
}
