import 'dart:io';

void main(List<String> arguments) {
  print("Digite um número: ");
  var line = stdin.readLineSync();

  try {
    double numero = double.parse(line ?? "");

    print(numero);
  } catch (e) {
    //Erro personalizado
    //throw Exception("Numero Inválido");

    //Print do erro
    print(e);
  } finally {
    print("Executando finally");
  }
}
