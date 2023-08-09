import 'dart:math';

class Pessoa {
  String _nome = "";
  double _peso = 0.0;
  double _altura = 0.0;
  double _imc = 0.0;
  String _categoriaImc = "";

  Pessoa(String nome, double peso, double altura) {
    _nome = nome;
    _peso = peso;
    _altura = altura;

    _calcularIMC();
    _categorizarImc();
  }

  void setNome(String nome) {
    _nome = nome;
  }

  void setPeso(double peso) {
    _peso = peso;

    if (_altura != 0.0) {
      _calcularIMC();
      _categorizarImc();
    }
  }

  void setAltura(double altura) {
    _altura = altura;

    if (_peso != 0.0) {
      _calcularIMC();
      _categorizarImc();
    }
  }

  String getNome() {
    return _nome;
  }

  double getPeso() {
    return _peso;
  }

  double getAltura() {
    return _altura;
  }

  void _calcularIMC() {
    _imc = _peso / pow(_altura, 2);
    _categorizarImc();
  }

  double getImc() {
    return _imc;
  }

  void _categorizarImc() {
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
  }

  String getCategoriaImc() {
    return _categoriaImc;
  }

  @override
  String toString() {
    return {
      "Nome": _nome,
      "Peso": _peso,
      "Altura": _altura,
      "IMC": _imc,
      "Categoria IMC": _categoriaImc
    }.toString();
  }
}
