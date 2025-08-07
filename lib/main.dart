import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hangman/core/colors.dart';

import 'screens/hom_screen.dart';
import 'screens/score_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'Hangman',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: AppColors.kTooltipColor,
            borderRadius: BorderRadius.circular(6.0),
          ),
          textStyle: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20.0,
            letterSpacing: 1.0,
            color: Colors.white,
          ),
        ),
        scaffoldBackgroundColor: AppColors.kColorPrimary,
        appBarTheme: AppBarTheme(
          color: AppColors.kColorPrimary,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
            letterSpacing: 1.0,
            color: Colors.black,
          ),
        ),
        textTheme: Theme.of(context).textTheme.apply(fontFamily: 'PatrickHand'),
      ),
      initialRoute: 'home_screen',
      routes: {
        'home_screen': (context) => HomeScreen(),
        'score_screen': (context) => const ScoreScreen(
              query: [],
            ),
      },
    );
  }
}
