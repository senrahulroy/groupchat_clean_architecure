import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class SignOutUseCase {
  final FirebaseRepository firebaseRepository;

  SignOutUseCase({required this.firebaseRepository});

  Future<void> signOut() {
    return  firebaseRepository.singOut();
  }
}
