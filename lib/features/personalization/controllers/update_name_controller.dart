import 'package:ecommerce_app/features/personalization/screens/profile/profile.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/network/network_manager.dart';
import 'package:ecommerce_app/utils/popups/fullscreen_loader.dart';

//! Controller to manage user related Functionality
class UpdateNameController extends GetxController {
  static UpdateNameController get instance => UpdateNameController();

  //* variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> updateUserFormKey = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  //* Init user data when Home Screen Appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //* fetch user Record
  Future<void> initializeNames() async {
    try {
      firstName.text = userController.user.value.firstName;
      lastName.text = userController.user.value.lastName;
    } catch (e) {
      firstName.text = '';
      lastName.text = '';
    }
  }

//* update the userName
  Future<void> updateName() async {
    try {
      //  Start Loading
      FullscreenLoader.openLoadingDialog(
          'We are updating your information', TImages.docerAnimation);

      // Check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullscreenLoader.stopLoadingDialog();
        return;
      }

      // Form Validation
      if (!updateUserFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoadingDialog();
        return;
      }

      // update users firstname and last name in the firebase Firestore
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateUserField(name);

      // update the Rx User value

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // remove loading
      FullscreenLoader.stopLoadingDialog();

      // show success message
      Loaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been upddated');
      // Move to previous screen
      Get.off(() => const ProfileScreen());
    } catch (e) {
      // remove loading
      FullscreenLoader.stopLoadingDialog();

      // show error message
      Loaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
