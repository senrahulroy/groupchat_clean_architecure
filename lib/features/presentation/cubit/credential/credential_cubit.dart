import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';

import '../../../domain/usecases/forgot_password_usecase.dart';
import '../../../domain/usecases/get_create_current_user_usecase.dart';
import '../../../domain/usecases/google_auth_usecase.dart';
import '../../../domain/usecases/sign_in_usecase.dart';
import '../../../domain/usecases/sign_up_usecase.dart';

part 'credential_state.dart';

class CredentialCubit extends Cubit<CredentialState> {
  final SignInUseCase signInUseCase;
  final SignUpUseCase signUpUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  final GoogleAuthUseCase googleAuthUseCase;

  CredentialCubit(
      {required this.signInUseCase,
      required this.signUpUseCase,
      required this.forgotPasswordUseCase,
      required this.getCreateCurrentUserUseCase,
      required this.googleAuthUseCase})
      : super(CredentialInitial());

  /// Sign in
  Future<void> submitSignIn({required UserEntity user}) async {
    emit(CredentialLoading());
    try {
      signInUseCase.signIn(user);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  ///
  Future<void> submitSignUp({required UserEntity user}) async {
    emit(CredentialLoading());

    try {
      await signUpUseCase.signUp(user);
      await getCreateCurrentUserUseCase.getCreateCurrentUserUseCase(user);
      emit(CredentialSuccess());
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  /// google
  Future<void> submitGoogleAuth({required UserEntity user}) async {
    try {
      await googleAuthUseCase.googleAuth();
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }

  /// forget pass
  Future<void> forgotPassword({required UserEntity user}) async {
    try {
      await forgotPasswordUseCase.forgotPasswordUseCase(user.email!);
    } on SocketException catch (_) {
      emit(CredentialFailure());
    } catch (_) {
      emit(CredentialFailure());
    }
  }
}
