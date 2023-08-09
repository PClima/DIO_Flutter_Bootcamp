import 'package:poo_project/enum/tipo_notificacao.dart';

import 'pessoa.dart';

class PessoaJuridica extends Pessoa {
  String _cnpj = "";

  void setCnpj(String cnpj) {
    _cnpj = cnpj;
  }

  String getCnpj() {
    return _cnpj;
  }

  PessoaJuridica(String nome, String endereco, String cnpj,
      {TipoNotificacao tipoNotificacao = TipoNotificacao.nenhum})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) {
    _cnpj = cnpj;
  }

  @override
  String toString() {
    return {
      "Nome": getNome(),
      "Endereço": getEndereco(),
      "CNPJ": _cnpj,
      "Tipo Notificação": getTipoNotificacao()
    }.toString();
  }
}
