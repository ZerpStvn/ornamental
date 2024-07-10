import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ornamental/model/savefav.dart';
import 'package:ornamental/page/homepage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BookmarkState>(
            create: (context) => BookmarkState()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ornamental',
          theme: ThemeData(
            fontFamily: GoogleFonts.poppins().fontFamily,
            colorScheme:
                ColorScheme.fromSeed(seedColor: const Color(0xffF69C33)),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
