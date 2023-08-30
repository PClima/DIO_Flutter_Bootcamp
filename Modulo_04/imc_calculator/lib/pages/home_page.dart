import 'package:flutter/material.dart';
import 'package:imc_calculator/model/pessoa.dart';
import 'package:imc_calculator/pages/dados_pessoa.dart';
import 'package:imc_calculator/pages/exibe_informacoes.dart';
import 'package:imc_calculator/repositories/pessoa_repository.dart';
import 'package:imc_calculator/shared/widgets/custom_drawer.dart';

class HomePage extends StatefulWidget {
  final int? id;
  const HomePage({super.key, this.id});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nomeController = TextEditingController();
  var pesoController = TextEditingController();
  var alturaController = TextEditingController();
  var imcController = TextEditingController();
  var categoriaController = TextEditingController();
  PessoaModel? _pessoa;
  PessoaRepository pessoaRepository = PessoaRepository();

  PageController controller = PageController(initialPage: 0);
  int posicaoPagina = 0;

  Widget returnText(String texto) {
    return Container(
        margin: const EdgeInsets.only(top: 20),
        child: Text(texto,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700)));
  }

  @override
  void initState() {
    super.initState();
    obterPessoa();
  }

  obterPessoa() async {
    if (widget.id == null) {
      _pessoa = await pessoaRepository.obterPessoa();
    } else {
      _pessoa = await pessoaRepository.obterPessoasById(widget.id!);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: _pessoa?.nome == null
              ? const Text("IMC Calculator")
              : Text(
                  "IMC Calculator - ${_pessoa?.nome}",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
        ),
        drawer: const CustomDrawer(),
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
                children: [
                  ExibeInformacoes(pessoaId: widget.id),
                  DadosPessoa(id: widget.id),
                ],
              ),
            ),
            BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  controller.jumpToPage(value);
                },
                currentIndex: posicaoPagina,
                items: const [
                  BottomNavigationBarItem(
                      label: "Home", icon: Icon(Icons.home)),
                  BottomNavigationBarItem(
                      label: "Configurações", icon: Icon(Icons.settings)),
                ]),
          ],
        ),
      ),
    );
  }
}
