import 'package:flutter/material.dart';
import 'package:healthypet/providers/beranda_provider.dart';
import 'package:healthypet/providers/navigation_bar_provider.dart';
import 'package:healthypet/screens/splash_screen.dart';
import 'package:healthypet/utils/color_themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigationBarProvider>(
          create: (context) => NavigationBarProvider(),
        ),
        ChangeNotifierProvider<BerandaProvider>(
          create: (context) => BerandaProvider(),
        )
      ],
      child: MaterialApp(
        title: 'HealThy Pet',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: ColorsThemes.primaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
