import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_strings.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_theme.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/InputTextField.dart';
import 'package:groupchat_clean_architecture/features/presentation/widgets/common_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _statusController = TextEditingController();

  @override
  void initState() {
    
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    _statusController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(65)),
            ),
            const Gap(15),
            const Text(AppStrings.strRemoveProfilePhoto,style: AppTextStyles.normalGreenBold,),
            const Gap(15),
             CustomInputTextField(

              controller: _nameController,
              labelText: AppStrings.strName,
              prefix: const Icon(Icons.person),
            ),
            const Gap(10),
            const CustomInputTextField(
              labelText: AppStrings.strEmail,
              prefix: Icon(Icons.email),
            ),
            const Gap(10),
             CustomInputTextField(
              controller: _statusController,
              labelText: AppStrings.strStatus,
              prefix: const Icon(Icons.info),
            ),
            const Gap(10),
            const Divider(thickness: 1.50,),
            const Gap(10),

            CommonButton(btnName: AppStrings.strUpdate, onPressed: () {

            },),

          ],
        ),
      ),
    );
  }
}
