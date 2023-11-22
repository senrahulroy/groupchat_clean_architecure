import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class GoogleAuthUseCase {
  final FirebaseRepository firebaseRepository;

  GoogleAuthUseCase({required this.firebaseRepository});

  Future<void> googleAuth() {
    return firebaseRepository.googleAuth();
  }
}
