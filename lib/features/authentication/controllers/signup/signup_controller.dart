import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/network/network_manager.dart';
import 'package:ecommerce_app/utils/popups/fullscreen_loader.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //* variables

  final email = TextEditingController(); //Controller for email input
  final password = TextEditingController(); //Controller for password input
  final firstName = TextEditingController(); //Controller for first name input
  final lastName = TextEditingController(); //Controller for last name input
  final username = TextEditingController(); //Controller for username input
  final phoneNumber = TextEditingController(); //Controller for phone input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //Form key for Form validation

  final hidePassword = true.obs; //observable for hiding / showing password
  final privacyPolicy =
      true.obs; //observable for check / uncheck privacy policy

  //* SIGNUP

  void signup() async {
    try {
      // Start Loading
      FullscreenLoader.openLoadingDialog(
          'We are processing your information', TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      // Validate Form

      if (!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check

      if (!privacyPolicy.value) {
        Loaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use',
        );
        return;
      }

      // Register user in the firebase Authentication & save user data in the firebase

      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove loader
      FullscreenLoader.stopLoadingDialog();

      // Show Sucess Message
      Loaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue',
      );

      // Move to verify Email Screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // Remove loader
      FullscreenLoader.stopLoadingDialog();

      // show some Generic Error to the user
      Loaders.errorSnackBar(title: 'oh Snap!', message: e.toString());
    } finally {
      // Remove loader
      FullscreenLoader.stopLoadingDialog();
    }
  }
}
