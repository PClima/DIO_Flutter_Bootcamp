import 'dart:math';

class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;
  String _categoriaImc = "";

  Pessoa(this._nome, this._altura, this._peso);

  //Getters

  String get nome => _nome;

  double get peso => _peso;

  double get altura => _altura;

  double get imc => _imc;

  String get categoriaImc => _categoriaImc;

  //Setters
  set nome(String nome) {
    _nome = nome;
  }

  set peso(double peso) {
    _peso = peso;
  }

  set altura(double altura) {
    _altura = altura;
  }

  double calcularIMC() {
    _imc = _peso / pow(_altura, 2);
    return _imc;
  }

  String categorizarIMC() {
    switch (_imc) {
      case < 16:
        _categoriaImc = "Magreza grave";
        break;

      case < 17:
        _categoriaImc = "Magreza Moderada";
        break;

      case < 18.5:
        _categoriaImc = "Magreza leve";
        break;

      case < 25:
        _categoriaImc = "Saudável";
        break;

      case < 30:
        _categoriaImc = "Sobrepeso";
        break;

      case < 35:
        _categoriaImc = "Obesidade Grau I";
        break;

      case < 40:
        _categoriaImc = "Obesidade Grau II (severa)";
        break;

      case >= 40:
        _categoriaImc = "Obesidade Grau III (mórbida)";
        break;
    }

    return _categoriaImc;
  }
}
