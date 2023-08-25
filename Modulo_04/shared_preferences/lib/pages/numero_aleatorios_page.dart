import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trilhaapp/service/app_storage.dart';

class NumerosAleatoriosPage extends StatefulWidget {
  const NumerosAleatoriosPage({super.key});

  @override
  State<NumerosAleatoriosPage> createState() => _NumerosAleatoriosPageState();
}

class _NumerosAleatoriosPageState extends State<NumerosAleatoriosPage> {
  int numeroGerado = 0;
  AppStorageService storage = AppStorageService();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    numeroGerado = await storage.getNumeroAleatorio();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Gerador de Números Aleatórios"),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                numeroGerado.toString(),
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            var random = Random();

            setState(() {
              numeroGerado = random.nextInt(1000);
            });

            storage.setNumeroAleatorio(numeroGerado);
          },
        ),
      ),
    );
  }
}
