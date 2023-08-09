import 'dart:io';

void main(List<String> arguments) {
  var number1 = double.parse(lerConsole("Informe o primeiro número: "));

  var number2 = double.parse(lerConsole("Informe o segundo número: "));

  var operacao = lerConsole("Informe a operação desejada: ");

  calculadora(number1, number2, operacao);
}

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync();
  return line ?? "";
}

void calculadora(double number1, double number2, String operator) {
  double resultado = 0.0;
  switch (operator) {
    case "+":
      resultado = number1 + number2;
      break;

    case "-":
      resultado = number1 - number2;
      break;

    case "*":
      resultado = number1 * number2;
      break;

    case "/":
      resultado = number1 / number2;
      break;

    default:
      print("Operação Inválida!");
      exit(0);
  }

  print(resultado);
}
