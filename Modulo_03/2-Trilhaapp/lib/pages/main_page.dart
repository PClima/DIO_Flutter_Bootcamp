import 'package:flutter/material.dart';
import 'package:trilhaapp/pages/dados_cadastrais.dart';
import 'package:trilhaapp/pages/pagina1.dart';
import 'package:trilhaapp/pages/pagina2.dart';
import 'package:trilhaapp/pages/pagina3.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Main Page"),
        ),
        drawer: Drawer(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
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
                                  builder: (context) =>
                                      const DadosCadastrais()));
                        },
                        child: const Text("Dados Cadastrais"))),
                const Divider(),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                        onTap: () {},
                        child: const Text("Termos de uso e privacidade"))),
                const Divider(),
                Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: 30),
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: InkWell(
                        onTap: () {}, child: const Text("Configurações")))
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (value) {
                  setState(() {
                    posicaoPagina = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: const [Pagina1Page(), Pagina2Page(), Pagina3Page()],
              ),
            ),
            BottomNavigationBar(
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Pag1", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(label: "Pag2", icon: Icon(Icons.add)),
                  BottomNavigationBarItem(
                      label: "Pag3", icon: Icon(Icons.person))
                ])
          ],
        ),
      ),
    );
  }
}
