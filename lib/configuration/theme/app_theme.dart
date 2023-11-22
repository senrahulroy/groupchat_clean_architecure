

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static const Color darkGreenColors = Color(0xFF388E3C);
  static const Color lightGreenColors = Color(0xFFC8E6C9);
  static const mainGreenColors = Color(0xFF4CAF50);
  static const lightRedColors = Color(0xFFD96F43);
  static const whiteColors = Color(0xFFFFFFFF);
  static const blackShadColors = Color(0xFF212121);
  static const dividerColors = Color(0xFFBDBDBD);
  static const blackColors =  Color(0xFF000000);
  static const greenColor = Color(0xFF4CAF50);
  static const greyColors = Color(0xFF747480);
  static const lightGreyColors = Color(0xFFC1C1C1);
}


class AppTextStyles {
  static const TextStyle largeGreenW700 =
  TextStyle(color: AppColors.greenColor, fontSize: 35, fontWeight: FontWeight.w700);

  static const TextStyle normalGreenBold =
  TextStyle(color: AppColors.greenColor, fontSize: 18, fontWeight: FontWeight.bold);

  static const TextStyle smallGreenBold =
  TextStyle(color: AppColors.greenColor, fontSize: 14, fontWeight: FontWeight.bold);

  static const TextStyle normalWhiteBold =
  TextStyle(color: AppColors.whiteColors, fontSize: 18, fontWeight: FontWeight.bold);

  static const TextStyle smallBlack =
  TextStyle(color: AppColors.blackColors, fontSize: 14, fontWeight: FontWeight.bold);
}
