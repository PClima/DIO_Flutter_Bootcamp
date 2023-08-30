import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc_calculator/model/pessoa.dart';
import 'package:imc_calculator/repositories/pessoa_repository.dart';

class DadosPessoa extends StatefulWidget {
  final int? id;
  const DadosPessoa({super.key, this.id});

  @override
  State<DadosPessoa> createState() => _DadosPessoaState();
}

class _DadosPessoaState extends State<DadosPessoa> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  PessoaModel? _pessoa;
  PessoaRepository pessoaRepository = PessoaRepository();

  @override
  void initState() {
    super.initState();
    obterPessoa();
  }

  obterPessoa() async {
    if (widget.id == null) {
      _pessoa = await pessoaRepository.obterPessoa();
    } else {
      _pessoa = await pessoaRepository.obterPessoasById(widget.id!);
    }

    if (_pessoa != null) {
      nomeController.text = _pessoa!.nome.toString();
      alturaController.text = _pessoa!.altura.toString();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _pessoa == null
          ? const SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Não há pessoas cadastradas para exibição!",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Para cadastrar, abra o menu lateral e clique em adicionar novo usuário!",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            )
          : Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: const Text(
                      "Nome:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: nomeController,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                    child: const Text(
                      "Altura:",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      controller: alturaController,
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: TextButton(
                        onPressed: () async {
                          _pessoa!.altura = double.parse(alturaController.text);

                          try {
                            await pessoaRepository.alterarPessoa(_pessoa!);

                            showDialog(
                              context: context,
                              builder: (BuildContext bc) {
                                return AlertDialog(
                                  title: const Text("Dados salvos com sucesso"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Ok"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                );
                              },
                            );
                          } catch (e) {
                            showDialog(
                              context: context,
                              builder: (BuildContext bc) {
                                return AlertDialog(
                                  title: const Text(
                                      "Erro ao salvar dados do usuário"),
                                  actions: [
                                    TextButton(
                                      child: const Text("Ok"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        child: const Text("Salvar"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
