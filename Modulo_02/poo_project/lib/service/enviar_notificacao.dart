import 'package:poo_project/classes/pessoa.dart';
import 'package:poo_project/enum/tipo_notificacao.dart';
import 'package:poo_project/service/IMPL/notificacao_email.dart';
import 'package:poo_project/service/IMPL/notificacao_push.dart';
import 'package:poo_project/service/IMPL/notificacao_sms.dart';
import 'package:poo_project/service/notificacao_interface.dart';

class EnviarNotificacao {
  NotificacaoInterface? notificacao;

  void notificar(Pessoa pessoa) {
    switch (pessoa.getTipoNotificacao()) {
      case TipoNotificacao.email:
        notificacao = NotificacaoEmail();
        break;

      case TipoNotificacao.pushNotification:
        notificacao = NotificacaoPush();
        break;

      case TipoNotificacao.sms:
        notificacao = NotificacaoSMS();
        break;
      default:
        return;
    }
    if (notificacao != null) {
      notificacao!.enviarNotificacao(pessoa);
    }
  }
}
