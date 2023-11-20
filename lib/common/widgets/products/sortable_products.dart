
import 'package:ecommerce_app/common/widgets/layout/grid_layout.dart';
import 'package:ecommerce_app/common/widgets/products/porduct_card_vertical.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SortableProducts extends StatelessWidget {
  const SortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //* DropDown
        DropdownButtonFormField(
          decoration:
              const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          onChanged: (value) {},
          items: [
            "Name",
            "Higher Price",
            "Lower Price",
            "Sale",
            "Newest",
            "Popularity"
          ]
              .map((options) =>
                  DropdownMenuItem(value: options, child: Text(options)))
              .toList(),
        ),

        const SizedBox(height: TSizes.spaceBtwSections),

        //* Products
        GridLayout(
          itemCount: 6,
          itemBuilder: (_, index) => const ProductCardVertical(),
        ),
      ],
    );
  }
}