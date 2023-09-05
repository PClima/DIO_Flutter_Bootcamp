import 'dart:convert';

import 'package:trilhaapp/model/viacep_model.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  Future<ViaCepModel> consultarCep(String cep) async {
    var viaCepModel = ViaCepModel();
    await http.get(Uri.parse("https://viacep.com.br/ws/${cep}/json/")).then(
      (value) {
        if (value.statusCode == 200) {
          var response = jsonDecode(value.body);
          viaCepModel = ViaCepModel.fromJson(response);
        }
      },
    );

    return viaCepModel;
  }
}
