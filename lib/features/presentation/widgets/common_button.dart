import 'package:flutter/material.dart';

import '../../../configuration/theme/app_theme.dart';
class CommonButton extends StatelessWidget {

  final String btnName;
  final VoidCallback onPressed;

  const CommonButton({super.key, required this.btnName, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: AppColors.greenColor, borderRadius: BorderRadius.circular(25)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:AppColors.greenColor,
        ),
        onPressed:onPressed,
        child:  Text(
          btnName,
          style: AppTextStyles.normalWhiteBold,
        ),
      ),
    );;
  }
}
