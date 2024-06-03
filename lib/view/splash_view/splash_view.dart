import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
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
    _preloadImage();

    SplashViewModel().splashTime(context);
  }

  void _preloadImage() {
    final image = AssetImage('images/plant_splash.jpeg');
    image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
            (info, call) {
          // Image loaded successfully
          setState(() {});
        },
        onError: (error, stackTrace) {
          // Handle error
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration: BoxDecoration(
          color: Color(0xFF1c4642),
          image: DecorationImage(
            image: AssetImage('images/plant_splash.jpeg'),
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
          ),
        ),
        child: DefaultTextStyle(
          style: const TextStyle(
            fontSize: 26.0,
            fontWeight: FontWeight.w700,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText('Green Vibes'),
            ],
            isRepeatingAnimation: true,
          ),
        ),
      ),
    );
  }
}
