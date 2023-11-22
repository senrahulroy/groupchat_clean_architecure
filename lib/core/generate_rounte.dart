import 'package:flutter/material.dart';
import 'package:groupchat_clean_architecture/configuration/theme/app_assets.dart';
import 'package:groupchat_clean_architecture/features/presentation/pages/splash/splash_screen.dart';
import 'package:lottie/lottie.dart';

class GenerateRoutes {
  static Route<dynamic> route(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        {
          return materialBuilder(widget: const SplashScreen());
        }

      default:
        {
          return materialBuilder(widget: const NoScreenAvailable());
        }
    }
  }
}

MaterialPageRoute materialBuilder({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}

class NoScreenAvailable extends StatelessWidget {
  const NoScreenAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(AppAssets.pageNotFoundJson),
      ),
    );
  }
}
