import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';
import '../repositories/firebase_repository.dart';

class GetUpdateUserUseCase {
  final FirebaseRepository firebaseRepository;

  GetUpdateUserUseCase({required this.firebaseRepository});

  Future<void> getUpdateUserUseCase(UserEntity user) {
    return firebaseRepository.getUpdateUser(user);
  }
}
