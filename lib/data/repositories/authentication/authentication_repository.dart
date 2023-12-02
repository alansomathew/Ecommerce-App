import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:ecommerce_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_app/navigation_menu.dart';
import 'package:ecommerce_app/utils/exceptions/firebase_auth_exceptions.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

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
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: _auth.currentUser?.email));
      }
    } else {
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
  }

  /* ------------- Email and password sign-in ------------- */

  // * [EmailAuthentication] - SignIn

  // * [EmailAuthentication] - Register

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw FirebaseAuthExceptions(e.code).message;
    } on FirebaseException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } on FormatException catch (_) {
      throw 'something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  // * [ReAuthenticate] - ReAuthenticate User

  // * [EmailVerification] - Mail Verification

  Future<void> sendMailVerification() async {
    try {
      await _auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } on FirebaseException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } on FormatException catch (_) {
      throw 'something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  // * [EmailAuthentication] - Forget PASSWORD

  /* ------------- Federated identity & social sign-in ------------- */

  // * [GoogleAuthentication] - Google

  // * [FacebookAuthentication] - FaceBook

  /* ------------- ./end Federated identity & social sign-in ------------- */

  // * [LogoutUser] - valid for any authentication

  Future<void> logout() async {
    try {
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } on FirebaseException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } on FormatException catch (_) {
      throw 'something went wrong. Please try again';
    } on PlatformException catch (e) {
      throw 'something went wrong. Please try again ${e.code}';
    } catch (e) {
      throw 'something went wrong. Please try again';
    }
  }

  // * Delete User - Remove user Auth and Firestore Account
}
