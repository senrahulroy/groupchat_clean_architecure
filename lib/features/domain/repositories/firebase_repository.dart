import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';

/// Firebase Repos
abstract class FirebaseRepository {
  /// Credential section
  Future<void> signIn(UserEntity user);

  Future<void> signUp(UserEntity user);

  Future<bool> isSignIn();

  Future<void> singOut();

  Future<void> forgetPassword(String email);

  Future<void> googleAuth();

  Future<void> getUpdateUser(UserEntity user);

  Future<void> getCreateUser(UserEntity user);

  Future<String> getCurrentUserId();



  /// FIXME:  missing methods
}
