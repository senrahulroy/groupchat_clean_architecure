import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';
import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository firebaseRepository;

  SignInUseCase({required this.firebaseRepository});

  Future<void> signIn(UserEntity user) {
    return firebaseRepository.signIn(user);
  }
}
