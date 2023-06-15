import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import 'package:movieapp/responsive/responisive.dart';
import 'package:movieapp/view/signupandlogin/login.dart';

class SplashScreenUi extends StatefulWidget {
  const SplashScreenUi({super.key});

  @override
  State<SplashScreenUi> createState() => _SplashScreenUiState();
}

class _SplashScreenUiState extends State<SplashScreenUi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gotohome();
  }

  @override
  Widget build(BuildContext context) {
    double sh = MediaQuery.of(context).size.height;
    double sw = MediaQuery.of(context).size.width;

    const colorizeColors = [
      Color(0xfffffc20),
      Color.fromARGB(255, 41, 41, 41),
      Color(0xfffffc20),
      Colors.orange,
      Colors.red,
    ];

    // const colorizeTextStyle = TextStyle(
    //   fontSize: 50.0,
    //   fontWeight: FontWeight.bold,
    // );
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: sh * (80 / Responsive.height)),
        alignment: Alignment.topCenter,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/splash screen/moviesplash.gif"),
              fit: BoxFit.cover),
        ),
        child: SizedBox(
          height: 70,
          child: AnimatedTextKit(
            pause: const Duration(seconds: 0),
            repeatForever: true,
            isRepeatingAnimation: true,
            animatedTexts: [
              ColorizeAnimatedText(
                'Flash Movies',
                textStyle: TextStyle(
                  fontFamily: "Comforter",
                  fontSize: sw * (50.0 / Responsive.width),
                  fontWeight: FontWeight.w700,
                  // fontStyle: FontStyle.italic,
                ),
                colors: colorizeColors,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> gotohome() async {
    await Future.delayed(const Duration(seconds: 3));

    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 800),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginUi(),
      ),
      (route) => false,
    );
  }
}
