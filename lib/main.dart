import 'package:flutter/material.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_theme.dart';
import 'package:groupchat_clean_architecture/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:groupchat_clean_architecture/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/auth/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/home/home_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dependency_injection.dart' as di;

Future<void> main() async {
  /// biding app
  WidgetsFlutterBinding.ensureInitialized();

  /// firebase biding
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// dependency injection
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
            create: (context) => di.sl<AuthCubit>()..appStarted()),
        BlocProvider<CredentialCubit>(
            create: (context) => di.sl<CredentialCubit>()),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme:
                ColorScheme.fromSeed(seedColor: AppColors.mainGreenColors),
            useMaterial3: true,
          ),
          home: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is AuthenticatedState) {
                return HomeScreen(uid: state.uid);
              } else {
                return const LoginScreens();
              }
            },
          )),
    );
  }
}
