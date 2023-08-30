import 'package:imc_calculator/model/pessoa.dart';
import 'package:imc_calculator/repositories/database.dart';

class PessoaRepository {
  Future<List<PessoaModel?>> obterPessoas() async {
    List<PessoaModel> pessoas = [];
    var db = await SqliteDataBase().getDatabase();

    var result = await db.rawQuery("SELECT * FROM pessoa");
    for (var element in result) {
      pessoas.add(PessoaModel(
        int.parse(element["id"].toString()),
        element["nome"].toString(),
        double.parse(element["peso"].toString()),
        double.parse(element["altura"].toString()),
      ));
    }

    return pessoas;
  }

  Future<PessoaModel?> obterPessoasById(int id) async {
    PessoaModel pessoa;
    var db = await SqliteDataBase().getDatabase();

    var result = await db.rawQuery("SELECT * FROM pessoa WHERE id = ?", [id]);

    pessoa = PessoaModel(
      int.parse(result.first["id"].toString()),
      result.first["nome"].toString(),
      double.parse(result.first["altura"].toString()),
      double.parse(result.first["peso"].toString()),
    );

    return pessoa;
  }

  Future<PessoaModel?> obterPessoa() async {
    PessoaModel? pessoa;
    var db = await SqliteDataBase().getDatabase();

    var result = await db.rawQuery("SELECT * FROM pessoa ORDER BY id DESC");

    if (result.isNotEmpty) {
      pessoa = PessoaModel(
        int.parse(result.first["id"].toString()),
        result.first["nome"].toString(),
        double.parse(result.first["altura"].toString()),
        double.parse(result.first["peso"].toString()),
      );
    }

    return pessoa;
  }

  Future<void> adicionarPessoa(PessoaModel pessoaModel) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawInsert("INSERT INTO pessoa(nome, peso, altura) VALUES(?, 0, 0)",
        [pessoaModel.nome]);
  }

  Future<void> removerPessoa(int id) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawDelete("DELETE FROM pessoa WHERE id = ?", [id]);
  }

  Future<void> alterarPessoa(PessoaModel pessoaModel) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawUpdate(
        "UPDATE pessoa SET nome = ?, peso = ?, altura = ? WHERE id = ?", [
      pessoaModel.nome,
      pessoaModel.peso,
      pessoaModel.altura,
      pessoaModel.id
    ]);
  }
}
