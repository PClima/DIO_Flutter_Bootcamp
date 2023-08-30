import 'package:flutter/material.dart';
import 'package:imc_calculator/model/imc.dart';
import 'package:imc_calculator/model/pessoa.dart';
import 'package:imc_calculator/pages/home_page.dart';
import 'package:imc_calculator/repositories/imc_repository.dart';
import 'package:imc_calculator/repositories/pessoa_repository.dart';
import 'package:imc_calculator/services/calcular_imc.dart';
import 'package:intl/intl.dart';

const List<String> list = <String>[
  'Maior IMC',
  'Menor IMC',
  'Data mais recente',
  'Data mais antiga'
];

class ExibeInformacoes extends StatefulWidget {
  final int? pessoaId;
  const ExibeInformacoes({super.key, this.pessoaId});

  @override
  State<ExibeInformacoes> createState() => _ExibeInformacoesState();
}

class _ExibeInformacoesState extends State<ExibeInformacoes> {
  TextEditingController pesoController = TextEditingController();
  PessoaModel? _pessoa;
  PessoaRepository pessoaRepository = PessoaRepository();

  String dropdownValue = list.first;

  var _imc = const <ImcModel?>[];
  ImcRepository imcRepository = ImcRepository();

  var services = CalcularIMC();

  @override
  void initState() {
    super.initState();
    obterImc();
  }

  obterImc() async {
    if (widget.pessoaId == null) {
      _pessoa = await pessoaRepository.obterPessoa();
    } else {
      _pessoa = await pessoaRepository.obterPessoasById(widget.pessoaId!);
    }

    if (_pessoa != null) {
      _imc = await imcRepository.obterImcByPessoa(_pessoa!.id, dropdownValue);
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 30),
                        child: Text(
                          "Histórico de avaliações",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.filter_list_rounded),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                            obterImc();
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      )
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      // Important: Remove any padding from the ListView.
                      padding: EdgeInsets.zero,
                      itemCount: _imc.length,
                      itemBuilder: (BuildContext bc, int index) {
                        var imc = _imc[index];
                        return Dismissible(
                          key: UniqueKey(),
                          direction: DismissDirection.startToEnd,
                          background: Container(
                            color: Colors.red,
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Icon(Icons.delete),
                                )
                              ],
                            ),
                          ),
                          confirmDismiss: (DismissDirection direction) async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirmar"),
                                  content: const Text(
                                      "Deseja realmente apagar esta medição?"),
                                  actions: <Widget>[
                                    TextButton(
                                        onPressed: () =>
                                            Navigator.of(context).pop(true),
                                        child: const Text("Apagar")),
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("Cancelar"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          onDismissed: (direction) {
                            imcRepository.deletarImc(imc.id);
                            setState(() {
                              _imc.removeAt(index);
                            });
                          },
                          child: ListTile(
                              title: Text(
                                "IMC: ${imc!.imc.toStringAsFixed(2)}",
                                style: const TextStyle(fontSize: 15),
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Categoria: ${imc.categoria}"),
                                  Text(
                                    DateFormat('dd/MM/yyyy HH:mm')
                                        .format(imc.dataCalculo),
                                  ),
                                ],
                              )),
                        );
                      },
                    ),
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext bc) {
                      pesoController.text = "";
                      return AlertDialog(
                        title: const Text("Qual o peso registrado hoje?"),
                        content: TextField(
                          controller: pesoController,
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancelar"),
                          ),
                          TextButton(
                            onPressed: () async {
                              if (_pessoa!.altura == 0.0 &&
                                  widget.pessoaId == null) {
                                Navigator.pop(context);
                                showDialog(
                                    context: context,
                                    builder: (BuildContext bc) {
                                      return AlertDialog(
                                        title:
                                            const Text("Erro ao calcular IMC"),
                                        content: const Text(
                                            "Altura não cadastrada\n\nPara cadastrar, acesse a aba de configurações e cadastre sua altura!"),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Text("Ok"),
                                          ),
                                        ],
                                      );
                                    });
                              } else {
                                var imc = services.calcularIMC(
                                    double.parse(pesoController.text),
                                    _pessoa!.altura);
                                var categoria = services.categorizarIMC(imc);

                                var modelImc = ImcModel(0, imc, categoria,
                                    DateTime.now(), _pessoa!.id);

                                await imcRepository.adicionarImc(
                                    imc,
                                    categoria,
                                    _pessoa!.id,
                                    _pessoa!.altura,
                                    double.parse(pesoController.text));
                                obterImc();
                                // ignore: use_build_context_synchronously
                                Navigator.pop(context);
                                setState(() {});
                              }
                            },
                            child: const Text("Salvar"),
                          )
                        ],
                      );
                    },
                  );
                },
                child: const Icon(Icons.add),
              ),
            ),
    );
  }
}
