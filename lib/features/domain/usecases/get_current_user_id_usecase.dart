import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';

class GetCurrentUserIdUseCase {
  final FirebaseRepository firebaseRepository;

  GetCurrentUserIdUseCase({required this.firebaseRepository});

  Future<String> getCurrentUserIdUseCase() {
    return firebaseRepository.getCurrentUserId();
  }
}
