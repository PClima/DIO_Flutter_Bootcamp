import 'package:hive/hive.dart';
import 'package:trilhaapp/model/tarefa_model.dart';

class TarefaHiveRepository {
  static late Box _box;

  TarefaHiveRepository._criar();

  static Future<TarefaHiveRepository> carregar() async {
    if (Hive.isBoxOpen('tarefasModel')) {
      _box = Hive.box('tarefasModel');
    } else {
      _box = await Hive.openBox('tarefasModel');
    }
    return TarefaHiveRepository._criar();
  }

  salvar(TarefaHiveModel tarefaHiveModel) {
    _box.add(tarefaHiveModel);
  }

  List<TarefaHiveModel> obterDados(bool naoConcluido) {
    if (naoConcluido) {
      return _box.values
          .cast<TarefaHiveModel>()
          .where((element) => !element.concluido)
          .toList();
    }
    return _box.values.cast<TarefaHiveModel>().toList();
  }

  alterar(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.save();
  }

  excluir(TarefaHiveModel tarefaHiveModel) {
    tarefaHiveModel.delete();
  }
}