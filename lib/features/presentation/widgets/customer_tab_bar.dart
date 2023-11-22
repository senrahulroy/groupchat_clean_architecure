import 'package:flutter/material.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_theme.dart';

typedef ToolbarIndexController = Function(int index);

class CustomTabBar extends StatelessWidget {
  final ToolbarIndexController toolbarIndexController;
  final int? pageIndex;

      CustomTabBar({
    super.key,
    required this.toolbarIndexController,
    this.pageIndex,
  });

  List<String> tabBarTitle = ['Groups', 'Users', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(color: AppColors.greenColor),
      child: Row(
        children: [
          ToolBarItem(
            onTap: () {
              toolbarIndexController(0);
            },
            title: tabBarTitle[0],
            borderColor: pageIndex == 0
                ? AppColors.whiteColors
                : Colors.transparent,
            textColor: pageIndex == 0
                ? AppColors.whiteColors
                : AppColors.blackColors,
          ),
          ToolBarItem(
            onTap: () {
               toolbarIndexController(1);
            },
            title: tabBarTitle[1],
            borderColor: pageIndex == 1
                ? AppColors.whiteColors
                : Colors.transparent,
            textColor: pageIndex == 1
                ? AppColors.whiteColors
                : AppColors.blackColors,
          ),
          ToolBarItem(
            onTap: () {
               toolbarIndexController(2);
            },
            title: tabBarTitle[2],
            borderColor: pageIndex == 2
                ? AppColors.whiteColors
                : Colors.transparent,
            textColor: pageIndex == 2
                ? AppColors.whiteColors
                : AppColors.blackColors,
          )
        ],
      ),
    );
  }
}

class ToolBarItem extends StatelessWidget {
  final String? title;
  final Color? textColor;
  final Color? borderColor;
  final double? borderWith;
  final VoidCallback? onTap;

  const ToolBarItem(
      {super.key,
      this.title,
      this.textColor,
      this.borderWith = 3.0,
      this.onTap,
      this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: borderColor!, width: borderWith!),
            ),
          ),
          child: Text(
            title!,
            style: TextStyle(
                fontSize: 18, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
