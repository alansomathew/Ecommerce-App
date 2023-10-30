import 'package:flutter/material.dart';

import 'package:ecommerce_app/common/widgets/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/brands/brand_card.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';

class BrandShowCase extends StatelessWidget {
  const BrandShowCase({
    super.key,
    required this.images,
  });
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      showBorder: true,
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      padding: const EdgeInsets.all(TSizes.md),
      child: Column(
        children: [
          //* Brand with Product Count
          const BrandCard(showBorder: false),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),

          //* Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandTopProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: RoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
