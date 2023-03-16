import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rock_paper_scissor_game/screens/game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.barlowSemiCondensed().fontFamily,
          colorScheme: ColorScheme(
              tertiary: const HSLColor.fromAHSL(1, 217, 0.16, 0.45).toColor(),
              brightness: Brightness.light,
              primary: const HSLColor.fromAHSL(1, 214, 0.47, 0.23).toColor(),
              onPrimary: Colors.white,
              secondary: const HSLColor.fromAHSL(1, 237, 0.49, 0.15).toColor(),
              onSecondary: Colors.white,
              error: const Color.fromRGBO(197, 34, 31, 1),
              onError: Colors.white,
              background: Colors.white,
              onBackground: Colors.black,
              surface: Colors.white,
              onSurface: Colors.black),
          textTheme: TextTheme(
              titleLarge: const TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              titleMedium: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: const HSLColor.fromAHSL(1, 229, 0.25, 0.31).toColor()),
              bodySmall: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.6,
                  color: const HSLColor.fromAHSL(1, 229, 0.64, 0.46).toColor()),
              bodyMedium: const TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.8,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              bodyLarge: TextStyle(
                  fontSize: 18,
                  letterSpacing: 1.8,
                  fontWeight: FontWeight.w700,
                  color:
                      const HSLColor.fromAHSL(1, 229, 0.25, 0.31).toColor()))),
      home: const GameScreen(),
    );
  }
}
