import 'package:imc_calculator/model/imc.dart';
import 'package:imc_calculator/repositories/database.dart';

class ImcRepository {
  Future<List<ImcModel?>> obterImcByPessoa(int id, String ordem) async {
    List<ImcModel> imc = [];
    var db = await SqliteDataBase().getDatabase();
    var result;
    switch (ordem) {
      case "Maior IMC":
        result = await db.rawQuery(
            "SELECT * FROM imc WHERE id_pessoa = ? ORDER BY imc DESC", [id]);

      case "Menor IMC":
        result = await db.rawQuery(
            "SELECT * FROM imc WHERE id_pessoa = ? ORDER BY imc ASC", [id]);

      case "Data mais recente":
        result = await db.rawQuery(
            "SELECT * FROM imc WHERE id_pessoa = ? ORDER BY data_calculo DESC",
            [id]);

      case "Data mais antiga":
        result = await db.rawQuery(
            "SELECT * FROM imc WHERE id_pessoa = ? ORDER BY data_calculo ASC",
            [id]);
    }

    for (var element in result) {
      imc.add(ImcModel(
          int.parse(element["id"].toString()),
          double.parse(element["imc"].toString()),
          element["categoria"].toString(),
          DateTime.parse(element["data_calculo"].toString()),
          id));
    }

    return imc;
  }

  Future<void> adicionarImc(double imc, String categoria, int id_pessoa,
      double altura, double peso) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawInsert(
        "INSERT INTO imc(imc, categoria, peso, altura, id_pessoa, data_calculo) VALUES(?, ?, ?, ?, ?, ?)",
        [imc, categoria, peso, altura, id_pessoa, DateTime.now().toString()]);
  }

  Future<void> deletarImc(int id) async {
    var db = await SqliteDataBase().getDatabase();

    await db.rawDelete("DELETE FROM imc WHERE id = ?", [id]);
  }
}
