import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/pages/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //Tirar faixa de debug mode do emulador
      debugShowCheckedModeBanner: false,
      //Definir cores do tema
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: GoogleFonts.pacificoTextTheme()),
      home: const HomePage(),
    );
  }
}
