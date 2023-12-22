import 'package:ecommerce_app/data/repositories/authentication/authentication_repository.dart';
import 'package:ecommerce_app/features/authentication/screens/password/reset_password.dart';
import 'package:ecommerce_app/utils/constants/image_strings.dart';
import 'package:ecommerce_app/utils/network/network_manager.dart';
import 'package:ecommerce_app/utils/popups/fullscreen_loader.dart';
import 'package:ecommerce_app/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //* Variables
  // final _auth = FirebaseAuth.instance;
  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //* Send Reset Password Email
  sendResetPasswordEmail() async {
    try {
      // start loading
      FullscreenLoader.openLoadingDialog(
          "Processing your request", TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullscreenLoader.stopLoadingDialog();
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        FullscreenLoader.stopLoadingDialog();
        return;
      }

      // send Email to reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());

      // Stop Loading
      FullscreenLoader.stopLoadingDialog();
      // Show Success Screen
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link send to Reset Your Password');
      // Redirect
      Get.to(() => ResetPassword(email: email.text.trim()));
    } catch (e) {
      // remove Loader
      FullscreenLoader.stopLoadingDialog();
      // Show Error
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  resendResetPasswordEmail(String email) async {
    try {
      // start loading
      FullscreenLoader.openLoadingDialog(
          "Processing your request", TImages.docerAnimation);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        FullscreenLoader.stopLoadingDialog();
        return;
      }

      // send Email to reset Password
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email);

      // Stop Loading
      FullscreenLoader.stopLoadingDialog();
      // Show Success Screen
      Loaders.successSnackBar(
          title: 'Email Sent',
          message: 'Email Link send to Reset Your Password');
    } catch (e) {
      // remove Loader
      FullscreenLoader.stopLoadingDialog();
      // Show Error
      Loaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }
}
