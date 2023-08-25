// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefa_model.dart';
import 'package:trilhaapp/repositories/tarefa_hive_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var descricaoController = TextEditingController();
  var _tarefas = const <TarefaHiveModel>[];
  late TarefaHiveRepository tarefaRepository;
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    tarefaRepository = await TarefaHiveRepository.carregar();

    _tarefas = tarefaRepository.obterDados(apenasNaoConcluidos);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          descricaoController.text = "";
          showDialog(
              context: context,
              builder: (BuildContext bc) {
                return AlertDialog(
                  title: const Text("Adicionar Tarefa"),
                  content: TextField(
                    controller: descricaoController,
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Cancelar")),
                    TextButton(
                        onPressed: () async {
                          await tarefaRepository.salvar(TarefaHiveModel.criar(
                              descricaoController.text, false));
                          Navigator.pop(context);
                          obterTarefas();
                          setState(() {});
                        },
                        child: const Text("Salvar"))
                  ],
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Apenas não concluídos",
                    style: TextStyle(fontSize: 18),
                  ),
                  Switch(
                    value: apenasNaoConcluidos,
                    onChanged: (value) {
                      apenasNaoConcluidos = value;
                      setState(() {
                        obterTarefas();
                      });
                    },
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _tarefas.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var tarefa = _tarefas[index];
                    return Dismissible(
                      key: Key(tarefa.descricao),
                      onDismissed: (direction) async {
                        tarefaRepository.excluir(tarefa);
                        obterTarefas();
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                          onChanged: (value) async {
                            tarefa.concluido = value;
                            tarefaRepository.alterar(tarefa);
                            obterTarefas();
                          },
                          value: tarefa.concluido,
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
