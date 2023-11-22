import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_assets.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_strings.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/InputTextField.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/common_button.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/commont_line_text.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/headerTop.dart';
import 'package:lottie/lottie.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
          child: Column(
            children: [
              /// login title
              const HeaderTop(title: AppStrings.strForgetPassword),
              ///
              Lottie.asset(AppAssets.forgotPasswordJson,
                  height: 200, width: 200, repeat: true),
              /// email field
              const CustomInputTextField(
                textInputType: TextInputType.emailAddress,
                labelText: AppStrings.strEnterEmailHere,
                prefix: Icon(Icons.email),
              ),
              const Gap(20),

              CommonButton(btnName: AppStrings.strReset, onPressed: () {}),

              const Gap(10),
              const CommonLineField(
                firstText: AppStrings.strRememberTheAccountInformation,
                secondText: AppStrings.strLogin,
              )
            ],
          ),
        ),
      ),
    );
  }
}
