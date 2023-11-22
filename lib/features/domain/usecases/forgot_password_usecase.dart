import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class ForgotPasswordUseCase {
  final FirebaseRepository firebaseRepository;

  ForgotPasswordUseCase({required this.firebaseRepository});

  Future<void> forgotPasswordUseCase(String email) {
    return firebaseRepository.forgetPassword(email);
  }
}
