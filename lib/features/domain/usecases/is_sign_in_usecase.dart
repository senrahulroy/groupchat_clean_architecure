import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class IsSignInUseCase {
  final FirebaseRepository firebaseRepository;

  IsSignInUseCase({required this.firebaseRepository});

  Future<bool> isSignIn() {
    return firebaseRepository.isSignIn();
  }
}
