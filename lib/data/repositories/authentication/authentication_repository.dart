import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get inistance => Get.find();

  //* Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  //* Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //* Function to show Relevent Screen

  screenRedirect() {
    //* Local Storage

    if (kDebugMode) {
      print('------------ Get Storage AuthRepo ------------');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnBoardingScreen());
  }

  /* ------------- Email and password sign-in ------------- */

  // * [EmailAuthentication] - SignIn

  // * [EmailAuthentication] - Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  // * [ReAuthenticate] - ReAuthenticate User

  // * [EmailVerification] - Mail Verification

  // * [EmailAuthentication] - Forget PASSWORD

  /* ------------- Federated identity & social sign-in ------------- */

  // * [GoogleAuthentication] - Google

  // * [FacebookAuthentication] - FaceBook

  /* ------------- ./end Federated identity & social sign-in ------------- */

  // * [LogoutUser] - valid for any authentication

  // * Delete User - Remove user Auth and Firestore Account
}
