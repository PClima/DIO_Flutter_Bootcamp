import 'dart:io';

void main(List<String> arguments) {
  print("Informe a primeira nota: ");
  var aux = stdin.readLineSync();
  var prova1 = int.parse(aux ?? "0");

  print("Informe a segunda nota: ");
  aux = stdin.readLineSync();
  var prova2 = int.parse(aux ?? "0");

  var media = (prova1 + prova2) / 2;

  //IF
  if (media >= 7) {
    print("O aluno passou com a nota $media");
  } else {
    print("O aluno reprovou com a nota $media");
  }

  //TERNARY IF
  var resultado = (prova1 >= 7) ? "O aluno passou" : "O aluno reprovou";
  print(resultado);
}
