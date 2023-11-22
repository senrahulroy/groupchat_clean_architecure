import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_assets.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_strings.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_theme.dart';
import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/auth/register/register_screen.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/InputTextField.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/common_button.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/commont_line_text.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/headerTop.dart';
import 'package:lottie/lottie.dart';

import '../../../cubit/auth/auth_cubit.dart';
import '../../../cubit/credential/credential_cubit.dart';
import '../../home/home_screen.dart';
import '../forgotPassword/forgetpassword_screen.dart';

class LoginScreens extends StatefulWidget {
  const LoginScreens({super.key});

  @override
  State<LoginScreens> createState() => _LoginScreensState();
}

class _LoginScreensState extends State<LoginScreens> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late FocusNode _emailFocusNode;
  late FocusNode _passFocusNode;

  bool isObscureText = false;

  @override
  void initState() {
    // TODO: implement initState
    _emailFocusNode = FocusNode();
    _passFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CredentialCubit, CredentialState>(
        listener: (context, credentialState) {
          if (credentialState is CredentialSuccess) {
            BlocProvider.of<AuthCubit>(context).loggedIn();
          }

          if (credentialState is CredentialFailure) {}
        },
        builder: (context, credentialState) {
          if (credentialState is CredentialLoading) {
            return const CircularProgressIndicator();
          }
          if (credentialState is CredentialSuccess) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                if (state is AuthenticatedState) {
                  return HomeScreen(
                    uid: state.uid,
                  );
                } else {
                  return _bodOfLoginPage(context);
                }
              },
            );
          }
          return _bodOfLoginPage(context);
        },
      ),
      // _bodOfLoginPage(context),
    );
  }

  void _submitSignIn() {
    if (_emailController.text.isEmpty) {
      ///  enter your email
      return;
    }

    if (_passwordController.text.isEmpty) {
      ///  your Password
      return;
    }

    BlocProvider.of<CredentialCubit>(context).submitSignIn(
        user: UserEntity(
      email: _emailController.text,
      password: _passwordController.text,
    ));
  }

  _bodOfLoginPage(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            /// login title
            const HeaderTop(title: AppStrings.strLogin),

            ///
            Lottie.asset(AppAssets.loginJson,
                height: 250, width: 250, repeat: true),

            /// email field
            CustomInputTextField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              textInputType: TextInputType.emailAddress,
              labelText: AppStrings.strEnterEmailHere,
              onSubmitted: (_) {
                _passFocusNode.requestFocus();
              },
              prefix: const Icon(Icons.email),
            ),
            const Gap(20),

            /// password field
            CustomInputTextField(
              controller: _passwordController,
              focusNode: _passFocusNode,
              textInputType: TextInputType.visiblePassword,
              labelText: AppStrings.strEnterPasswordHere,
              isObscureText: isObscureText,
              prefix: const Icon(Icons.security),
              suffix: InkWell(
                  onTap: () {
                    setState(() {
                      isObscureText = !isObscureText;
                    });
                  },
                  child: isObscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
            ),

            /// Forget password field
            const Gap(15),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPassword(),
                      ));
                },
                child: _forGetPassword()),
            const Gap(15),

            CommonButton(
                btnName: AppStrings.strLogin,
                onPressed: () {
                  _submitSignIn();
                }),

            const Gap(10),

            CommonLineField(
              firstText: AppStrings.strDontHaveAccount,
              secondText: AppStrings.strRegister,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }

  /// Widget for ForgetPassword
  Widget _forGetPassword() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          AppStrings.strForgetPassword,
          style: AppTextStyles.normalGreenBold,
        )
      ],
    );
  }
}
