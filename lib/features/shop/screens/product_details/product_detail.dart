import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widget/bottom_add_to_cart.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widget/product_image_silder.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            //? Product Image slider
            const ProductImageSlider(),

            //? Product details
            Padding(
              padding: const EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //? Rating adn share Icon
                  const RatingAndShare(),

                  //? Price Title,stock,Brand
                  const ProductMetaData(),
                  const SizedBox(height: TSizes.spaceBtwItems),


                  //? Attributes
                  const ProductAttributes(),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //? Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Checkout')),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //? Description
                  const SectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eget aliquam ultricies, nunc sapien aliquet nunc, vitae aliquam nisl nunc eget nisl. Donec euismod, nisl eget aliquam ultricies, nunc sapien aliquet nunc, vitae aliquam nisl nunc eget nisl.',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: ' Show more',
                    trimExpandedText: ' Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //? Reviews
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHeading(
                        title: 'Reviews(199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
