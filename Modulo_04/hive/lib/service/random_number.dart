import 'dart:math';

class RandomNumberGeneratorService {
  static int gerarNumeroAleatorio(int maxNumber) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(maxNumber);
  }
}
