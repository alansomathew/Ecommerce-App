import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/features/personalization/screens/address/add_new_adddress.dart';
import 'package:ecommerce_app/features/personalization/screens/address/widgets/single_address.dart';
import 'package:ecommerce_app/utils/constants/colors.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: TColors.white),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Address', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            SingleAddress(
              selectedAddress: true,
              address:
                  'Thekkedath Kannickal P.O Moolamattom,Idukki,Kerala,India,685589',
              name: 'Alanso Mathew',
              phone: '+91 94479 08235',
            ),
            SingleAddress(
              selectedAddress: false,
              address:
                  'Thekkedath Kannickal P.O Moolamattom,Idukki,Kerala,India,685589',
              name: 'Alanso Mathew',
              phone: '+91 94479 08235',
            ),
          ]),
        ),
      ),
    );
  }
}
