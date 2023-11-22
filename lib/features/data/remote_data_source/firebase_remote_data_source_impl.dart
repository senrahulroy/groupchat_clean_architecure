import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupchat_clean_architecture/features/data/remote_data_source/firbase_remote_data_source.dart';
import 'package:groupchat_clean_architecture/features/data/remote_data_source/model/user_model.dart';
import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';

class FirebaseRemoteDaraSourceImple implements FirebaseRemoteDataSource {
  final FirebaseFirestore fireStore;
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignIn;

  FirebaseRemoteDaraSourceImple(
      {required this.fireStore,
      required this.firebaseAuth,
      required this.googleSignIn});

  @override
  Future<void> forgetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> getCreateUser(UserEntity user) async {
    final userCollection = fireStore.collection('users');

    final uid = await getCurrentUserId();

    userCollection.doc(uid).get().then((userDoc) {
      final newUser = UserModel(
        name: user.name,
        email: user.email,
        phoneNumber: user.password,
        isOnline: user.isOnline,
        uid: user.uid,
        status: user.status,
        profileUrl: user.profileUrl,
        password: user.password,
        dob: user.dob,
        gender: user.gender,
      ).toDocument();

      if (!userDoc.exists) {
        userCollection.doc(uid).set(newUser);
      }
    });
  }

  @override
  Future<String> getCurrentUserId() async {
    String userUid = firebaseAuth.currentUser!.uid;
    return userUid;
  }

  @override
  Future<void> getUpdateUser(UserEntity user) {
    // TODO: implement getUpdateUser
    throw UnimplementedError();
  }

  @override
  Future<void> googleAuth() {
    // TODO: implement googleAuth
    throw UnimplementedError();
  }

  @override
  Future<bool> isSignIn() async {
    bool isSignIn = firebaseAuth.currentUser?.uid != null;
    return isSignIn;
  }

  @override
  Future<void> signIn(UserEntity user) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> signUp(UserEntity user) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> singOut() async {
    await firebaseAuth.signOut();
  }
}
