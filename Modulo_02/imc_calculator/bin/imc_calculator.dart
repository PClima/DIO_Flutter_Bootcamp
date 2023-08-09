import 'dart:io';

import 'package:imc_calculator/classes/pessoa.dart';
import 'package:imc_calculator/utils/utils.dart';

void main(List<String> arguments) {
  limpaTela();
  //Perguntar nome.
  String nome = lerConsole("Digite seu nome: ");

  //Perguntar peso, validar valor inserido
  double peso = 0.0;
  bool validator = false;
  do {
    limpaTela();
    try {
      peso = double.parse(lerConsole("Digite seu peso (em KG): "));
      validator = true;
    } catch (e) {
      print("Valor para peso inválido!");
    }
  } while (!validator);

  //Perguntar altura, validar valor inserido
  double altura = 0.0;
  validator = false;
  do {
    limpaTela();
    try {
      altura = double.parse(lerConsole("Digite sua altura (em m): "));
      validator = true;
    } catch (e) {
      print("Valor para altura inválido!");
    }
  } while (!validator);

  var pessoa = Pessoa(nome, peso, altura);

  validator = false;
  do {
    limpaTela();
    try {
      var opcao = lerConsole(
          "O que deseja consultar?\n1 - IMC\n2 - Categoria do IMC\n3 - Dados da pessoa cadastrada\n4 - Alterar Dados\nS - Sair\n\nOpção Desejada: ");
      switch (opcao.toUpperCase()) {
        case "1":
          print("Seu IMC está calculado em: ${pessoa.getImc()}");
          lerConsole("\n\nPressione 'ENTER' para continuar!");
          break;

        case "2":
          print("Seu IMC está categorizado em: ${pessoa.getCategoriaImc()}");
          lerConsole("Pressione 'ENTER' para continuar!");
          break;

        case "3":
          print(pessoa);
          lerConsole("Pressione 'ENTER' para continuar!");
          break;

        case "4":
          alterarDados(pessoa);
          break;

        case "S":
          exit(0);

        default:
          throw Exception("Opção Inválida!");
      }
    } catch (e) {
      print(e);
    }
  } while (!validator);
}
