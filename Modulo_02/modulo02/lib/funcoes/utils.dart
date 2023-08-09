import 'dart:io';

String lerConsole(String texto) {
  print(texto);
  var line = stdin.readLineSync();
  return line ?? "";
}
