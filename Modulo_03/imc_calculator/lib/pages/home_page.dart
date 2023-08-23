import 'package:flutter/material.dart';
import 'package:imc_calculator/model/pessoa.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  var imcController = TextEditingController();
  var categoriaController = TextEditingController();

  Widget returnText(String texto) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(texto,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "IMC Calculator",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: ListView(
              children: [
                returnText("Nome:"),
                TextField(
                  controller: nomeController,
                ),
                returnText("Peso:"),
                TextField(
                  controller: pesoController,
                ),
                returnText("Altura:"),
                TextField(
                  controller: alturaController,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextButton(
                      onPressed: () {
                        var pessoa = Pessoa(
                            nomeController.text,
                            double.parse(alturaController.text),
                            double.parse(pesoController.text));
                        imcController.text = pessoa.calcularIMC().toString();
                        categoriaController.text =
                            pessoa.categorizarIMC().toString();

                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {});
                      },
                      child: const Text("Calcular IMC")),
                ),
                returnText("IMC Calculado:"),
                returnText(imcController.text),
                const Divider(),
                returnText("Categoria:"),
                returnText(categoriaController.text),
              ],
            ),
          )),
    );
  }
}
