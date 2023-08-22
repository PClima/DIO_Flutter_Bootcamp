import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/login_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.orange),
              currentAccountPicture: InkWell(
                onTap: () {
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      context: context,
                      builder: (BuildContext bc) {
                        return Wrap(
                          children: [
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title: const Text("Câmera"),
                              leading: const Icon(Icons.camera),
                            ),
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title: const Text("Galeria"),
                              leading: const Icon(Icons.photo),
                            )
                          ],
                        );
                      });
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.network(
                      "https://hermes.digitalinnovation.one/assets/diome/logo.png"),
                ),
              ),
              accountName: const Text("Pedro Cordeiro"),
              accountEmail: const Text("email@email.com")),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 0),
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                    onTap: () {
                      //Fechar menu aberto
                      Navigator.pop(context);

                      //Navegar para página
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const DadosCadastrais()));
                    },
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: const Icon(Icons.person)),
                        const Text("Dados Cadastrais"),
                      ],
                    ))),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          context: context,
                          builder: (BuildContext bc) {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              child: Column(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: const Text(
                                      "Termos de uso e privacidade",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. In finibus rutrum turpis, nec posuere ex iaculis id. Nam condimentum suscipit libero, sit amet dignissim enim aliquam ut. Donec finibus nec nisl eu finibus. Nullam gravida, massa et tempus lobortis, ante dui auctor eros, vitae fringilla sapien turpis sodales elit. Nullam in urna vel neque facilisis vestibulum. Pellentesque interdum porttitor pretium. Donec finibus mauris quis purus viverra malesuada. Donec vestibulum cursus nisi, quis scelerisque lorem laoreet at. Phasellus consectetur consequat lorem, vel interdum sem posuere eget. Aenean aliquet ipsum metus, sed dignissim justo fermentum sed. Sed auctor est vel ipsum mattis interdum. Cras efficitur faucibus porttitor. Proin tincidunt leo in sapien viverra dapibus. Etiam finibus quam non erat varius, et iaculis nulla eleifend.",
                                    style: TextStyle(fontSize: 16),
                                    textAlign: TextAlign.justify,
                                  ),
                                ],
                              ),
                            );
                          });
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const Icon(Icons.info),
                        ),
                        const Text("Termos de uso e privacidade"),
                      ],
                    ))),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                    onTap: () {},
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const Icon(Icons.settings),
                        ),
                        const Text("Configurações"),
                      ],
                    ))),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext bc) {
                            return AlertDialog(
                              alignment: Alignment.centerLeft,
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              title: const Text(
                                "Meu App",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              content: const Wrap(children: [
                                Text("Voce sairá do aplicativo"),
                                Text("Deseja sair do aplicativo?"),
                              ]),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Não")),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const LoginPage()));
                                    },
                                    child: const Text("Sim")),
                              ],
                            );
                          });
                    },
                    child: Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(right: 15),
                          child: const Icon(Icons.exit_to_app),
                        ),
                        const Text("Sair"),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
