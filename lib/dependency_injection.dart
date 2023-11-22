import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:groupchat_clean_architecture/features/data/remote_data_source/firbase_remote_data_source.dart';
import 'package:groupchat_clean_architecture/features/data/remote_data_source/firebase_remote_data_source_impl.dart';
import 'package:groupchat_clean_architecture/features/data/repositories/firebase_repository_impl.dart';
import 'package:groupchat_clean_architecture/features/domain/repositories/firebase_repository.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/forgot_password_usecase.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/get_create_current_user_usecase.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/get_current_user_id_usecase.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/google_auth_usecase.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/is_sign_in_usecase.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/sign_in_usecase.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/sign_out_usecase.dart';
import 'package:groupchat_clean_architecture/features/domain/usecases/sign_up_usecase.dart';
import 'package:groupchat_clean_architecture/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:groupchat_clean_architecture/features/presentation/cubit/credential/credential_cubit.dart';

/// initialise a service locator (sl)
final sl = GetIt.instance;

Future<void> init() async {
  ///  add all  bloc

  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      getCurrentUserIdUseCase: sl.call(),
      signOutUserCase: sl.call()));
  // a registerFactory create a new instance & add all view model here for
  // create new instance of model

  sl.registerFactory<CredentialCubit>(() => CredentialCubit(
      signInUseCase: sl.call(),
      signUpUseCase: sl.call(),
      forgotPasswordUseCase: sl.call(),
      getCreateCurrentUserUseCase: sl.call(),
      googleAuthUseCase: sl.call()));

  /// add all UseCases
  // AuthCubit useCase
  sl.registerLazySingleton(
      () => GetCurrentUserIdUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton(
      () => IsSignInUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton(() => SignOutUseCase(firebaseRepository: sl.call()));

  // a registerLazyFactory create a
  // same instance create in memory no need to create there instance
  // Credential useCase
  sl.registerLazySingleton(() => SignInUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton(() => SignUpUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton(
      () => ForgotPasswordUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton(
      () => GetCreateCurrentUserUseCase(firebaseRepository: sl.call()));
  sl.registerLazySingleton(
      () => GoogleAuthUseCase(firebaseRepository: sl.call()));

  ///  Repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  ///  remote dataSource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDaraSourceImple(
          fireStore: sl.call(),
          firebaseAuth: sl.call(),
          googleSignIn: sl.call()));

  ///  local dataSource

  ///  External Package add instance
  final firebaseAuth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;
  final googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => fireStore);
  sl.registerLazySingleton(() => googleSignIn);

  /// etc
}
