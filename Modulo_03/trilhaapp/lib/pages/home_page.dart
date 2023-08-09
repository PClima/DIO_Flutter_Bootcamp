import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trilhaapp/service/random_number.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var number = 0;
  var quantidadeDeCliques = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My App",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: Container(
        //Definir para ocupar o espaço necessario
        width: double.infinity,
        //margin: const EdgeInsets.fromLTRB(8, 16, 8, 16),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Ações do Usuário",
              style: GoogleFonts.acme(fontSize: 20),
            ),
            Text(
              "Foi clicado $quantidadeDeCliques vezes",
              style: GoogleFonts.acme(fontSize: 20),
            ),
            Text(
              "O numero gerado foi : $number",
              style: GoogleFonts.acme(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "10",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
                Text(
                  "20",
                  style: GoogleFonts.acme(fontSize: 20),
                ),
                Text(
                  "30",
                  style: GoogleFonts.acme(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline),
        onPressed: () {
          setState(() {
            quantidadeDeCliques++;
            number = RandomNumberGeneratorService.gerarNumeroAleatorio(1000);
          });
        },
      ),
    );
  }
}
