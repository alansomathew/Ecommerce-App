import 'package:ecommerce_app/common/widgets/products/add_remove_button.dart';
import 'package:ecommerce_app/common/widgets/products/card_item.dart';
import 'package:ecommerce_app/common/widgets/texts/product_price_text.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemBuilder: (_, index) => Column(
        children: [
          const CardItem(),
          if (showAddRemoveButtons)
            const SizedBox(height: TSizes.spaceBtwItems),
          if (showAddRemoveButtons)
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(width: 70),
                    ProductQuantityWithAddRemove(),
                  ],
                ),
                ProductPriceText(price: '256'),
              ],
            ),
        ],
      ),
    );
  }
}
