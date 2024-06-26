import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ornamental/page/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ornamental',
        theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffF69C33)),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}
