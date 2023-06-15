import 'package:flutter/material.dart';

class SplashScreenUi extends StatelessWidget {
  const SplashScreenUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage("assets/images/splash screen/moviesplash.gif"))),
      ),
    );
  }
}
