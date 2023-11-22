import 'package:groupchat_clean_architecture/features/data/remote_data_source/firbase_remote_data_source.dart';
import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';
import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> forgetPassword(String email) async {
    // TODO: implement forgetPassword
    return remoteDataSource.forgetPassword(email);
  }

  @override
  Future<void> getCreateUser(UserEntity user) async {
    // TODO: implement getCreateUser
    return remoteDataSource.getCreateUser(user);
  }

  @override
  Future<String> getCurrentUserId() async {
    // TODO: implement getCurrentUserId
    return remoteDataSource.getCurrentUserId();
  }

  @override
  Future<void> getUpdateUser(UserEntity user) async {
    // TODO: implement getUpdateUser
    return remoteDataSource.getUpdateUser(user);
  }

  @override
  Future<void> googleAuth() async {
    // TODO: implement googleAuth
    return remoteDataSource.googleAuth();
  }

  @override
  Future<bool> isSignIn() async {
    // TODO: implement isSignIn
    return remoteDataSource.isSignIn();
  }

  @override
  Future<void> signIn(UserEntity user) async {
    // TODO: implement signIn
    return remoteDataSource.signIn(user);
  }

  @override
  Future<void> signUp(UserEntity user) async {
    // TODO: implement signUp
    return remoteDataSource.signUp(user);
  }

  @override
  Future<void> singOut() async {
    // TODO: implement singOut
    return remoteDataSource.singOut();
  }
}
