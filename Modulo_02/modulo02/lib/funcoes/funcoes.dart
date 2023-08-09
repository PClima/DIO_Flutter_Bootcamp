import 'package:modulo02/funcoes/utils.dart' as utils;

void main(List<String> arguments) {
  var line = utils.lerConsole("Digite um número ou 'S' para sair");
  double acumulador = 0.0;

  while (line != "s" || line != "S") {
    var numero = double.parse(line);
    acumulador += numero;
    line = utils.lerConsole("Digite um número ou 'S' para sair");
  }

  print(acumulador);
}
