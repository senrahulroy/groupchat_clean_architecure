import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';
import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class SignUpUseCase {
  final FirebaseRepository firebaseRepository;

  SignUpUseCase({required this.firebaseRepository});

  Future<void> signUp(UserEntity user) {
    return firebaseRepository.signUp(user);
  }
}
