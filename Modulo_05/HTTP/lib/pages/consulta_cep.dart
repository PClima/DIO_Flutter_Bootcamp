import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/viacep_model.dart';
import 'package:trilhaapp/repositories/via_cep_repository.dart';

class ConsultaCep extends StatefulWidget {
  const ConsultaCep({super.key});

  @override
  State<ConsultaCep> createState() => _ConsultaCepState();
}

class _ConsultaCepState extends State<ConsultaCep> {
  var cepController = TextEditingController(text: "");
  var viaCepModel = ViaCepModel();
  ViaCepRepository viaCepRepository = ViaCepRepository();

  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            children: [
              const Text(
                "Consulta de CEP",
                style: TextStyle(fontSize: 22),
              ),
              TextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                controller: cepController,
                onChanged: (String value) async {
                  var cep = value.trim().replaceAll(RegExp(r'[^0-9]'), "");
                  if (cep.length == 8) {
                    setState(() {
                      loading = true;
                    });
                    viaCepModel = await viaCepRepository.consultarCep(cep);
                  }
                  setState(() {
                    loading = false;
                  });
                },
              ),
              !loading
                  ? Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Text(
                        cepController.text
                                    .replaceAll(RegExp(r'[^0-9]'), "")
                                    .length ==
                                8
                            ? viaCepModel.logradouro ?? ""
                            : "",
                        style: const TextStyle(fontSize: 22),
                      ),
                    )
                  : Container(),
              !loading
                  ? Text(
                      cepController.text
                                  .replaceAll(RegExp(r'[^0-9]'), "")
                                  .length ==
                              8
                          ? "${viaCepModel.localidade ?? ""} - ${viaCepModel.uf ?? ""}"
                          : "",
                      style: const TextStyle(fontSize: 22),
                    )
                  : Container(),
              Visibility(visible: loading, child: CircularProgressIndicator())
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // var response = await http.get(Uri.parse("https://www.google.com"));
            // debugPrint(response.body.toString());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
