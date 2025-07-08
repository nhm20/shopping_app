import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(),
        // colorScheme: ColorScheme(brightness: brightness, primary: primary, onPrimary: onPrimary, secondary: secondary, onSecondary: onSecondary, error: error, onError: onError, surface: surface, onSurface: onSurface)
        // colorScheme: ColorScheme.dark(),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromRGBO(254, 206, 1, 1))
      ),
      home: const Homepage(),
    );
  }
}
