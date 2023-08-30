import 'dart:math';

class CalcularIMC {
  double calcularIMC(double peso, double altura) {
    return peso / pow(altura, 2);
  }

  String categorizarIMC(double imc) {
    String categoriaImc = "";
    switch (imc) {
      case < 16:
        categoriaImc = "Magreza grave";
        break;

      case < 17:
        categoriaImc = "Magreza Moderada";
        break;

      case < 18.5:
        categoriaImc = "Magreza leve";
        break;

      case < 25:
        categoriaImc = "Saudável";
        break;

      case < 30:
        categoriaImc = "Sobrepeso";
        break;

      case < 35:
        categoriaImc = "Obesidade Grau I";
        break;

      case < 40:
        categoriaImc = "Obesidade Grau II (severa)";
        break;

      case >= 40:
        categoriaImc = "Obesidade Grau III (mórbida)";
        break;
    }

    return categoriaImc;
  }
}
