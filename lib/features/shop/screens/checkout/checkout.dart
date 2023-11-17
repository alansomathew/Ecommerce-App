import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/container/rounded_container.dart';
import 'package:ecommerce_app/common/widgets/products/coupon_widget.dart';
import 'package:ecommerce_app/common/widgets/success_screen/success_screen.dart';
import 'package:ecommerce_app/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce_app/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';
import 'package:ecommerce_app/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Reviews',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //* items in cart
              const CartItems(showAddRemoveButtons: false),
              const SizedBox(height: TSizes.spaceBtwSections),

              //* Coupon TextField
              const CouponCode(),

              const SizedBox(height: TSizes.spaceBtwSections),

              //* Billing Sections
              RoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    //* Pricing
                    BillingAmountSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //* Divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //* Payment Methods
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems),

                    //* Address
                    BillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => SuccessScreen(
                  image: TImages.successfulPaymentIcon,
                  title: 'Payment Success',
                  subTitle: 'Your Item will be Shipped Soon',
                  onPressed: () => Get.offAll(() => const NavigationMenu()),
                )),
            child: const Text('Checkout \u{20B9}256.0')),
      ),
    );
  }
}
