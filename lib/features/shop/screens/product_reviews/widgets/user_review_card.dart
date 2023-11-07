import 'package:ecommerce_app/common/widgets/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/products/rating_indicator.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Alanso Mathew',
                    style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        //* Review
        Row(
          children: [
            const RatingIndicator(rating: 4.0),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('24 Nov 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus facilisis magna arcu, et imperdiet est vestibulum fermentum. Pellentesque varius dictum massa ac condimentum. In id lacus eu sapien finibus feugiat quis quis nisi. Nullam gravida, mauris et sagittis convallis, purus erat posuere ante, ut molestie erat urna nec diam. Sed eget egestas ligula. Etiam gravida, ex vitae suscipit mollis, sem risus auctor orci, ut egestas ante neque vel magna. Suspendisse imperdiet convallis porttitor. Proin dictum luctus nisl at tempor. Maecenas quam felis, congue id scelerisque eu, dignissim at ex. Duis ex nisi, rutrum a libero a, suscipit ullamcorper mauris. Nulla sollicitudin at tortor id venenatis. Integer in aliquam est. Quisque facilisis nisi ac fringilla eleifend. Nunc aliquam vestibulum tincidunt.',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: 'Show less',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        //* Company Review
        RoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: const EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "A's Store",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "25 Nov 2023",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus facilisis magna arcu, et imperdiet est vestibulum fermentum. Pellentesque varius dictum massa ac condimentum. In id lacus eu sapien finibus feugiat quis quis nisi. Nullam gravida, mauris et sagittis convallis, purus erat posuere ante, ut molestie erat urna nec diam. Sed eget egestas ligula. Etiam gravida, ex vitae suscipit mollis, sem risus auctor orci, ut egestas ante neque vel magna. Suspendisse imperdiet convallis porttitor. Proin dictum luctus nisl at tempor. Maecenas quam felis, congue id scelerisque eu, dignissim at ex. Duis ex nisi, rutrum a libero a, suscipit ullamcorper mauris. Nulla sollicitudin at tortor id venenatis. Integer in aliquam est. Quisque facilisis nisi ac fringilla eleifend. Nunc aliquam vestibulum tincidunt.',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections)
      ],
    );
  }
}
