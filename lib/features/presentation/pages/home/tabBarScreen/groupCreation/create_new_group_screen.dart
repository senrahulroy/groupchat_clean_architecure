import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_strings.dart';

import '../../../../../../configuration/theme/app_theme.dart';
import '../../../../widgets/InputTextField.dart';
import '../../../../widgets/common_button.dart';

class CreateNewGroupScreen extends StatefulWidget {
  const CreateNewGroupScreen({super.key});

  @override
  State<CreateNewGroupScreen> createState() => _CreateNewGroupScreenState();
}

class _CreateNewGroupScreenState extends State<CreateNewGroupScreen> {
  final TextEditingController _groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: Text(AppStrings.strAppName),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 32),
        child: Column(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  color: Colors.grey, borderRadius: BorderRadius.circular(65)),
            ),
            const Gap(15),
            InkWell(
              onTap: () {
                debugPrint('Press Add group Photo');
              },
              child: const Text(
                AppStrings.strAddGroupPhoto,
                style: AppTextStyles.normalGreenBold,
              ),
            ),
            const Gap(15),
            CustomInputTextField(
              controller: _groupNameController,
              labelText: AppStrings.strGroupName,
              prefix: const Icon(Icons.drive_file_rename_outline),
            ),
            const Gap(10),
            const CustomInputTextField(
              labelText: AppStrings.strNumberOfUserJoinGroup,
              prefix: Icon(Icons.format_list_numbered),
            ),
            const Gap(10),
            const Divider(
              thickness: 1.50,
            ),
            const Gap(10),
            CommonButton(
              btnName: AppStrings.strCreateNewGroup,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
