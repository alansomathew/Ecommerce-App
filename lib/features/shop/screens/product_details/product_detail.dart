import 'package:ecommerce_app/features/shop/screens/product_details/widget/product_image_silder.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:ecommerce_app/features/shop/screens/product_details/widget/rating_share_widget.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //? Product Image slider
            ProductImageSlider(),

            //? Product details
            Padding(
              padding: EdgeInsets.only(
                left: TSizes.defaultSpace,
                right: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //? Rating adn share Icon
                  RatingAndShare(),

                  //? Price Title,stock,Brand
                  ProductMetaData()

                  //? Attributes

                  //? Checkout Button

                  //? Description

                  //? Reviews
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
