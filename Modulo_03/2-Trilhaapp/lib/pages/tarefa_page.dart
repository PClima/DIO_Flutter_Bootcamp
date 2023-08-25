// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:trilhaapp/model/tarefa.dart';
import 'package:trilhaapp/repositories/tarefa_repository.dart';

class TarefaPage extends StatefulWidget {
  const TarefaPage({super.key});

  @override
  State<TarefaPage> createState() => _TarefaPageState();
}

class _TarefaPageState extends State<TarefaPage> {
  var descricaoController = TextEditingController();
  var _tarefas = const <Tarefa>[];
  var tarefaRepository = TarefaRepository();
  var apenasNaoConcluidos = false;

  @override
  void initState() {
    super.initState();
    obterTarefas();
  }

  void obterTarefas() async {
    if (apenasNaoConcluidos) {
      _tarefas = await tarefaRepository.getTarefasNaoConcluidas();
    } else {
      _tarefas = await tarefaRepository.getTarefas();
    }

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
                          await tarefaRepository.adicionarTarefa(
                              Tarefa(descricaoController.text, false));
                          Navigator.pop(context);
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
                    "Apenas não concluídos!",
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
                      key: Key(tarefa.id),
                      onDismissed: (direction) async {
                        await tarefaRepository.remove(tarefa.id);
                        obterTarefas();
                      },
                      child: ListTile(
                        title: Text(tarefa.descricao),
                        trailing: Switch(
                          onChanged: (value) async {
                            await tarefaRepository.alterarStatus(
                                tarefa.id, value);
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
