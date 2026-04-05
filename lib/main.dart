import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cake_shop_list_ui.dart';
import 'splash_screen_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Cake Shop App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFE88AA8)),
        textTheme: GoogleFonts.promptTextTheme(),
        useMaterial3: true,
      ),
      home: const SplashScreenUi(nextPage: CakeShopListUi()),
    );
  }
}
