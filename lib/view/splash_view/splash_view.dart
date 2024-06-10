import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:plant_shop/utils/app_colors/app_colors.dart';
import 'package:plant_shop/view_model/splash_view_model/splash_view_model.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    // Preload the image

    SplashViewModel().splashTime(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGreenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.40,
              decoration: BoxDecoration(
                // color: Color(0xFF1c4642),
                image: DecorationImage(
                  image: AssetImage('images/trans.png',),
                  fit: BoxFit.contain,
                  // colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
                ),
              ),
            ),
            DefaultTextStyle(
              style: const TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.w700,
                  color: AppColors.primaryColor
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  WavyAnimatedText('Green View'),
                ],
                isRepeatingAnimation: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
