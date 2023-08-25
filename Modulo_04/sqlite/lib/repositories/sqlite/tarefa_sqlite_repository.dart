import 'package:trilhaapp/model/tarefa_sqlite_model.dart';
import 'package:trilhaapp/repositories/sqlite/database.dart';

class TarefaSqliteRepository {
  Future<List<TarefaSqliteModel>> obterDados(bool apenasNaoConcluidos) async {
    List<TarefaSqliteModel> tarefas = [];
    var db = await SqliteDataBase().getDatabase();

    var result = await db.rawQuery(apenasNaoConcluidos
        ? "SELECT id, descricao, concluido FROM tarefas where concluido = 0"
        : 'SELECT id, descricao, concluido FROM tarefas');

    for (var element in result) {
      tarefas.add(TarefaSqliteModel(int.parse(element["id"].toString()),
          element["descricao"].toString(), element["concluido"] == 1));
    }
    return tarefas;
  }

  Future<void> salvar(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawInsert(
        'INSERT INTO tarefas (descricao, concluido) values(?, ?)',
        [tarefaSqliteModel.descricao, tarefaSqliteModel.concluido]);
  }

  Future<void> update(TarefaSqliteModel tarefaSqliteModel) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawUpdate(
        'UPDATE tarefas SET descricao = ?, concluido = ? WHERE id = ?', [
      tarefaSqliteModel.descricao,
      tarefaSqliteModel.concluido ? 1 : 0,
      tarefaSqliteModel.id
    ]);
  }

  Future<void> delete(int id) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawDelete('DELETE FROM tarefas WHERE id = ?', [id]);
  }
}
