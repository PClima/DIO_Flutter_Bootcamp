import 'dart:io';

void main(List<String> arguments) {
  print("Informe o primeiro número: ");
  var number1 = double.parse(stdin.readLineSync() ?? "0");

  print("Informe o segundo número: ");
  var number2 = double.parse(stdin.readLineSync() ?? "0");

  print("Informe a operação desejada: ");
  var operator = stdin.readLineSync();

  double resultado = 0.0;
  // if (operator == "+") {
  //   resultado = number1 + number2;
  // } else if (operator == "-") {
  //   resultado = number1 - number2;
  // } else if (operator == "*") {
  //   resultado = number1 * number2;
  // } else if (operator == "/") {
  //   resultado = number1 / number2;
  // } else {
  //   print("Operação Inválida");
  //   exit(0);
  // }

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
