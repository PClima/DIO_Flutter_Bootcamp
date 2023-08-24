import 'package:trilhaapp/model/card_detail.dart';

class CardDetailRepository {
  Future<CardDetail> get() async {
    await Future.delayed(const Duration(seconds: 3));
    return CardDetail(
        1,
        "Meu Card",
        "https://hermes.digitalinnovation.one/assets/diome/logo.png",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In finibus rutrum turpis, nec posuere ex iaculis id. Nam condimentum suscipit libero, sit amet dignissim enim aliquam ut. Donec finibus nec nisl eu finibus. Nullam gravida, massa et tempus lobortis, ante dui auctor eros, vitae fringilla sapien turpis sodales elit. Nullam in urna vel neque facilisis vestibulum. Pellentesque interdum porttitor pretium. Donec finibus mauris quis purus viverra malesuada. Donec vestibulum cursus nisi, quis scelerisque lorem laoreet at. Phasellus consectetur consequat lorem, vel interdum sem posuere eget. Aenean aliquet ipsum metus, sed dignissim justo fermentum sed. Sed auctor est vel ipsum mattis interdum. Cras efficitur faucibus porttitor. Proin tincidunt leo in sapien viverra dapibus. Etiam finibus quam non erat varius, et iaculis nulla eleifend.");
  }
}
