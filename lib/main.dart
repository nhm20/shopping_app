import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        title: 'Shopping App',
        theme: ThemeData(
          textTheme: GoogleFonts.latoTextTheme().copyWith(
            titleMedium: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: const TextStyle(fontSize: 16),
            titleLarge: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          colorScheme: ColorScheme.fromSeed(
            seedColor: Color.fromRGBO(254, 206, 1, 1),
            primary: Color.fromRGBO(254, 206, 1, 1),
          ),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
          ),
          useMaterial3: true,
        ),
        home: const Homepage(),
      ),
    );
  }
}

//Provider works based on InheritedWidget, which is a way to pass data down the widget tree.
//it picks nearest Provider<String> in the widget tree and returns it.

//Provider
//ChangeNotifierProvider
//FutureProvider -lazy loading data
//StreamProvider - for listening to streams
