import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/features/authentication/models/user_model.dart';
import 'package:get/get.dart';

//! Repository class for user related operations.
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  //* Variables
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //* Function to save user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('users').doc(user.id).set(user.toJson());
    }
    
    
     catch (e) {
      throw 'something went wrong. Please try again';
    }
  }
}
