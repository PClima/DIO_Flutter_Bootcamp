import 'package:poo_project/enum/tipo_notificacao.dart';

import 'pessoa.dart';

class PessoaFisica extends Pessoa {
  String _cpf = "";

  void setCnpj(String cpf) {
    _cpf = cpf;
  }

  String getCnpj() {
    return _cpf;
  }

  PessoaFisica(String nome, String endereco, String cpf,
      {TipoNotificacao tipoNotificacao = TipoNotificacao.NENHUM})
      : super(nome, endereco, tipoNotificacao: tipoNotificacao) {
    _cpf = cpf;
  }

  @override
  String toString() {
    return {
      "Nome": getNome(),
      "Endereço": getEndereco(),
      "CPF": _cpf,
      "Tipo Notificação": getTipoNotificacao()
    }.toString();
  }
}
