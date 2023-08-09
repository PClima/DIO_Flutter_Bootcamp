import 'dart:convert';
import 'dart:io';

import 'package:imc_calculator/classes/pessoa.dart';

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync(encoding: utf8);
  return line ?? "";
}

void limpaTela() {
  print(Process.runSync("clear", [], runInShell: true).stdout);
}

void alterarDados(Pessoa pessoa) {
  bool validador = false;

  do {
    limpaTela();
    try {
      var opcao = lerConsole(
          "O que deseja alterar?\n1 - Nome\n2 - Peso\n3 - Altura\nV - Voltar\n\nOpção Desejada: ");
      switch (opcao.toUpperCase()) {
        case "1":
          pessoa.setNome(lerConsole("\nDigite o nome desejado: "));
          break;

        case "2":
          pessoa.setPeso(
              double.parse(lerConsole("\nDigite o peso desejado (em Kg): ")));
          break;

        case "3":
          pessoa.setAltura(
              double.parse(lerConsole("Digite a altura desejada (em m): ")));
          break;

        case "V":
          break;

        default:
          throw Exception("Opção Inválida!");
      }
      validador = true;
    } catch (e) {
      print(e);
    }
  } while (!validador);
}
