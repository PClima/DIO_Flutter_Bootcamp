import 'package:poo_project/classes/pessoa_fisica.dart';
import 'package:poo_project/classes/pessoa_juridica.dart';
import 'package:poo_project/enum/tipo_notificacao.dart';
import 'package:poo_project/service/enviar_notificacao.dart';

void main(List<String> arguments) {
  var pf1 = PessoaFisica("Pedro", "Rua 1", "22222222");
  print(pf1);

  var pj1 = PessoaJuridica("Pedro", "Rua 1", "37128372615",
      tipoNotificacao: TipoNotificacao.SMS);
  print(pj1);

  EnviarNotificacao enviarNotificacao = EnviarNotificacao();
  enviarNotificacao.notificar(pf1);
  enviarNotificacao.notificar(pj1);
}
