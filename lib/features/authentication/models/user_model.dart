//* Model class representing user data
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/utils/formatters/formatter.dart';

class UserModel {
  //? Keep those values final which you do not want to update later
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

//? Constructor of user model class
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  //? Helper function to get the full name of the user
  String get fullName => '$firstName $lastName';

  //? Helper function to format the phone number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  //? Helper function to split the full name into first name and last name
  static List<String> nameParts(fullName) => fullName.split(" ");

  //? Static Function to generate a username from the full name.
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    //? Add more logic to generate username from the full name if needed.
    String camelCaseUserName =
        "$firstName$lastName"; // combine first and last name
    String usernameWithPrefix = "cwt_$camelCaseUserName";
    return usernameWithPrefix;
  }

  //? Static Function to create an empty user model
  static UserModel empty() => UserModel(
        id: '',
        email: '',
        firstName: '',
        lastName: '',
        username: '',
        phoneNumber: '',
        profilePicture: '',
      );

  //? Convert model to Json Structure for saving in the Firebase Firestore
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

//? Factory method to create a user model from a Firebase DocumentSnapshot
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data['Email'] ?? '',
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        username: data['Username'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return empty();
    }
  }
}
