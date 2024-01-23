import 'package:ecommerce_app/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:ecommerce_app/common/widgets/shimmers/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'package:ecommerce_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_app/common/widgets/image/circular_image.dart';
import 'package:ecommerce_app/common/widgets/texts/section_heading.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //? Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image =
                          networkImage.isNotEmpty ? networkImage : TImages.user;

                      return controller.imageUploading.value
                          ? const ShimmerEffect(
                              width: 80,
                              height: 80,
                              radius: 80,
                            )
                          : CircularImage(
                              image: image,
                              width: 80,
                              height: 80,
                              isNetworkImage: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),

              //? Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const SectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(
                onTap: () => Get.to(() => const ChangeName()),
                title: 'Name',
                value: controller.user.value.fullName,
              ),
              ProfileMenu(
                onTap: () {},
                title: 'Username',
                value: controller.user.value.username,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              //? Heading personel info
              const SectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              ProfileMenu(
                onTap: () {},
                title: 'UserID',
                value: controller.user.value.id,
                icon: Iconsax.copy,
              ),
              ProfileMenu(
                onTap: () {},
                title: 'E-mail',
                value: controller.user.value.email,
              ),
              ProfileMenu(
                onTap: () {},
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
              ),
              ProfileMenu(
                onTap: () {},
                title: 'Gender',
                value: 'male',
              ),
              ProfileMenu(
                onTap: () {},
                title: 'Date of Birth',
                value: '24 Nov 2000',
              ),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
