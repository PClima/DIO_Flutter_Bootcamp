import 'package:poo_project/classes/pessoa.dart';
import 'package:poo_project/service/notificacao_interface.dart';

class NotificacaoPush implements NotificacaoInterface {
  @override
  void EnviarNotificacao(Pessoa pessoa) {
    print("Enviando Push para ${pessoa.getNome()}");
  }
}
