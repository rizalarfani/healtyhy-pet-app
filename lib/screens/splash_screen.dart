import 'package:flutter/material.dart';
import 'package:healthypet/screens/home.dart';
import 'package:healthypet/utils/color_themes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Home(),
      )),
    );

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.png',
            width: double.maxFinite,
            height: double.maxFinite,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 42),
                SafeArea(
                  child: Image.asset(
                    'assets/images/logo.png',
                    width: 144,
                    height: 22,
                  ),
                ),
                const SizedBox(height: 70),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(
                      height: 152 / 100,
                      letterSpacing: 3.5 / 100,
                      fontSize: 24,
                      fontFamily: 'manrope',
                      color: ColorsThemes.secundaryTextColor,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Helping You \n',
                      ),
                      TextSpan(
                        text: 'to keep ',
                      ),
                      TextSpan(
                        text: 'your bestie \n',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      TextSpan(
                        text: 'stay healthy!',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
