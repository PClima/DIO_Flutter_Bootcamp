import 'package:trilhaapp/model/tarefa.dart';

class TarefaRepository {
  final List<Tarefa> _tarefas = [];

  Future<void> adicionarTarefa(Tarefa tarefa) async {
    await Future.delayed(const Duration(milliseconds: 0));
    _tarefas.add(tarefa);
  }

  Future<void> alterarStatus(String id, bool concluido) async {
    await Future.delayed(const Duration(milliseconds: 0));
    _tarefas.where((tarefa) => tarefa.id == id).first.concluido = concluido;
  }

  Future<void> remove(String id) async {
    await Future.delayed(const Duration(milliseconds: 0));
    _tarefas.remove(_tarefas.where((tarefa) => tarefa.id == id).first);
  }

  Future<List<Tarefa>> getTarefas() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return _tarefas;
  }

  Future<List<Tarefa>> getTarefasNaoConcluidas() async {
    await Future.delayed(const Duration(milliseconds: 0));
    return _tarefas.where((tarefa) => !tarefa.concluido).toList();
  }
}
