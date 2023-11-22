import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/is_sign_in_usecase.dart';
import '../../../domain/usecases/get_current_user_id_usecase.dart';
import '../../../domain/usecases/sign_out_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  /// add Usecase for authenticate funcation
  final IsSignInUseCase isSignInUseCase;
  final GetCurrentUserIdUseCase getCurrentUserIdUseCase;
  final SignOutUseCase signOutUserCase;

  AuthCubit({
    required this.isSignInUseCase,
    required this.getCurrentUserIdUseCase,
    required this.signOutUserCase,
  }) : super(AuthInitial());

  /// first time app run with login user & pass

  /// sign in method with user data store
  Future<void> appStarted() async {
    try {
      final isSignIn = await isSignInUseCase.isSignIn();

      if (isSignIn) {
        // if user authenticate
        final uid = await getCurrentUserIdUseCase.getCurrentUserIdUseCase();

        // we have to emit state as per condition
        emit(AuthenticatedState(uid: uid));
      } else {
        // if user is unAuthenticate
        emit(UnAuthenticatedState());
      }
    } on SocketException catch (_) {
      emit(UnAuthenticatedState());
    }
  }

  /// loggedLoin method
  Future<void> loggedIn() async {
    try {
      final uid = await getCurrentUserIdUseCase.getCurrentUserIdUseCase();
      emit(AuthenticatedState(uid: uid));
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }


  /// loggedOut method
  Future<void> loggedOut() async {
    try {
      signOutUserCase.signOut();
      emit(UnAuthenticatedState());
    } catch (_) {
      emit(UnAuthenticatedState());
    }
  }
}
