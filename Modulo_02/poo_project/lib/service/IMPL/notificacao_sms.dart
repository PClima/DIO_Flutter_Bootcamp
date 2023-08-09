import 'package:poo_project/classes/pessoa.dart';
import 'package:poo_project/service/notificacao_interface.dart';

class NotificacaoSMS implements NotificacaoInterface {
  @override
  void EnviarNotificacao(Pessoa pessoa) {
    print("Enviando SMS para ${pessoa.getNome()}");
  }
}
