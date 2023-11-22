import 'package:flutter/material.dart';

import '../../../configuration/theme/app_theme.dart';

class CommonLineField extends StatelessWidget {
  final String firstText;
  final TextStyle? firstTextStyle;

  final VoidCallback? onPressed;
  final String? secondText;
  final TextStyle? secondTextStyle;

  const CommonLineField(
      {super.key,
      required this.firstText,
      this.firstTextStyle = AppTextStyles.smallBlack,
      this.onPressed,
      this.secondText = " ",
      this.secondTextStyle = AppTextStyles.smallGreenBold});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstText,
          style: firstTextStyle,
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            secondText!,
            style: AppTextStyles.smallGreenBold,
          ),
        ),
      ],
    );
  }
}
