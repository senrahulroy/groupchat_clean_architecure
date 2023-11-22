import 'package:flutter/material.dart';
import '../../../configuration/theme/app_theme.dart';
import 'package:gap/gap.dart';


class HeaderTop extends StatelessWidget {
  final String title;
  const HeaderTop({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        loginText(title),
        const Gap(10),
        const Divider(thickness: 1.5),
        const Gap(10),
      ],
    );
  }


  loginText(String txt) {
    return Container(
        alignment: Alignment.topLeft,
        child:
          Text(txt, style: AppTextStyles.largeGreenW700));
  }
}
