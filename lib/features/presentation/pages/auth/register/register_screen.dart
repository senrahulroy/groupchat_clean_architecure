import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_assets.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_strings.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_theme.dart';
import 'package:groupchat_clean_architecture/features/domain/entities/user_entity.dart';
import 'package:groupchat_clean_architecture/features/presentation/cubit/auth/auth_cubit.dart';
import 'package:groupchat_clean_architecture/features/presentation/cubit/credential/credential_cubit.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/home/home_screen.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/common_button.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/commont_line_text.dart';
import 'package:lottie/lottie.dart';

import '../../../widgets/InputTextField.dart';
import '../../../widgets/headerTop.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _selectGenderController = TextEditingController();

  late FocusNode _userNameFocusNode;
  late FocusNode _emailFocusNode;
  late FocusNode _passFocusNode;
  late FocusNode _confirmPasswordFocusNode;
  late FocusNode _dateOfBirthFocusNode;
  late FocusNode _selectGenderFocusNode;

  bool isObscureText = false;
  bool isCObscureText = false;

  @override
  void initState() {
    // TODO: implement initState
    _userNameFocusNode = FocusNode();
    _emailFocusNode = FocusNode();
    _passFocusNode = FocusNode();
    _confirmPasswordFocusNode = FocusNode();
    _dateOfBirthFocusNode = FocusNode();
    _selectGenderFocusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    /// All TextEditorController
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _dateOfBirthController.dispose();
    _selectGenderController.dispose();

    /// all FocusNode
    _userNameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    _dateOfBirthFocusNode.dispose();
    _selectGenderFocusNode.dispose();
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
    );
  }

  /// this  function for submit SignUP
   _submitSingUP() {
    debugPrint('enter in email');
    if (_userNameController.text.isEmpty) {
      // toast('enter your username');
      debugPrint('email');
      return;
    }
    if (_emailController.text.isEmpty) {
      /// Toast(...msg) Email isEmpty
      debugPrint('email empty');
      return;
    }
    if (_passwordController.text == _confirmPasswordController.text) {
      /// Toast(...msg) passs b
      debugPrint('pass not match');

      return;
    } else {
      /// this
      debugPrint('print else  ');
    }
    debugPrint('Block start');

    BlocProvider.of<CredentialCubit>(context).submitSignUp(
        user: UserEntity(
      name: _userNameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      isOnline: false,
      status: "",
      profileUrl: "",
      phoneNumber: "",
      dob: _dateOfBirthController.text.isEmpty
          ? ""
          : _dateOfBirthController.text,
      gender: _selectGenderController.text.isEmpty
          ? ""
          : _selectGenderController.text,
    ));

    debugPrint('block end');
  }

  _bodOfLoginPage(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            /// Registration title
            const HeaderTop(title: AppStrings.strRegistration),

            ///
            _profileWidget(),
            const Gap(20),

            /// User Name
            CustomInputTextField(
              controller: _userNameController,
              focusNode: _userNameFocusNode,
              textInputType: TextInputType.name,
              labelText: AppStrings.strUserName,
              onSubmitted: (_) {
                _emailFocusNode.requestFocus();
              },
              prefix: const Icon(Icons.person),
            ),
            const Gap(10),

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
            const Gap(10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(thickness: 1.5, color: Colors.green),
            ),
            const Gap(10),

            /// password field
            CustomInputTextField(
              controller: _passwordController,
              focusNode: _passFocusNode,
              textInputType: TextInputType.visiblePassword,
              labelText: AppStrings.strEnterPasswordHere,
              isObscureText: isObscureText,
              onSubmitted: (_) {
                _confirmPasswordFocusNode.requestFocus();
              },
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
            const Gap(10),

            /// confirm password field
            CustomInputTextField(
              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocusNode,
              textInputType: TextInputType.visiblePassword,
              labelText: AppStrings.strEnterPasswordHereAgain,
              isObscureText: isCObscureText,
              onSubmitted: (_) {
                _dateOfBirthFocusNode.requestFocus();
              },
              prefix: const Icon(Icons.security),
              suffix: InkWell(
                  onTap: () {
                    setState(() {
                      isCObscureText = !isCObscureText;
                    });
                  },
                  child: isCObscureText
                      ? const Icon(Icons.visibility_off)
                      : const Icon(Icons.visibility)),
            ),
            const Gap(10),

            /// Date of Birth
            CustomInputTextField(
              controller: _dateOfBirthController,
              focusNode: _dateOfBirthFocusNode,
              textInputType: TextInputType.name,
              labelText: AppStrings.strDateOfBirth,
              onSubmitted: (_) {
                _selectGenderFocusNode.requestFocus();
              },
              prefix: const Icon(Icons.date_range),
            ),
            const Gap(10),

            /// Gender
            CustomInputTextField(
              controller: _selectGenderController,
              focusNode: _selectGenderFocusNode,
              textInputType: TextInputType.emailAddress,
              labelText: AppStrings.strGender,
              onSubmitted: (_) {
                _passFocusNode.requestFocus();
              },
              prefix: const Icon(Icons.transgender),
            ),

            const Gap(15),
            CommonButton(
                btnName: AppStrings.strRegister,
                onPressed: () {
                  debugPrint('btn pressed');
                  _submitSingUP();
                }),
            const Gap(10),
            const CommonLineField(
              firstText: AppStrings.strAlreadyHaveAAccount,
              secondText: AppStrings.strLogin,
            )
          ],
        ),
      ),
    );
  }

  Widget _profileWidget() {
    return Column(
      children: [
        Lottie.asset(AppAssets.registerJson,
            height: 150, width: 150, repeat: true),
        InkWell(
            onTap: () {},
            child: const Text(
              AppStrings.strAddProfilePhoto,
              style: AppTextStyles.normalGreenBold,
            )),
      ],
    );
  }
}
