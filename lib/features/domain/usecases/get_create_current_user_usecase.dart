import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';

import '../repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase {
  final FirebaseRepository firebaseRepository;

  GetCreateCurrentUserUseCase({required this.firebaseRepository});

  Future<void> getCreateCurrentUserUseCase(UserEntity user) {
    return firebaseRepository.getCreateUser(user);
  }
}
