import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? phoneNumber,
    final bool? isOnline,
    final String? uid,
    final String? status,
    final String? profileUrl,
    final String? password,
    final String? dob,
    final String? gender,
  }) : super(
          name: name,
          email: email,
          phoneNumber: phoneNumber,
          isOnline: isOnline,
          uid: uid,
          status: status,
          profileUrl: profileUrl,
          password: password,
          dob: dob,
          gender: gender,
        );

  /// factory Method
  factory UserModel.fromSnapshot(DocumentSnapshot snapShot) {
    return UserModel(
      name: snapShot.get('name'),
      email: snapShot.get('email'),
      phoneNumber: snapShot.get('phoneNumber'),
      isOnline: snapShot.get('isOnline'),
      uid: snapShot.get('uid'),
      status: snapShot.get('status'),
      profileUrl: snapShot.get('profileUrl'),
      password: snapShot.get('password'),
      dob: snapShot.get('dob'),
      gender: snapShot.get('gender'),
    );
  }

  /// TO store fire store data method
  Map<String, dynamic> toDocument() {
    return {
      "name": name,
      "email": email,
      "phoneNumber": phoneNumber,
      "isOnline": isOnline,
      "uid": uid,
      "status": status,
      "profileUrl": profileUrl,
      "dob": dob,
      "gender": gender,
    };
  }
}
