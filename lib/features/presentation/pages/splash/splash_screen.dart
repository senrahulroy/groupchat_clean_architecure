import 'package:flutter/material.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/auth/login/login_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../../configuration/theme/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400 * 10), () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return const LoginScreens();
        },
      ));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Lottie.asset(AppAssets.splashJson),
      ),
    );
  }
}
