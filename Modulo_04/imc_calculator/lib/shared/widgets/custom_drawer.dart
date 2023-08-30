import 'package:flutter/material.dart';
import 'package:imc_calculator/model/pessoa.dart';
import 'package:imc_calculator/pages/home_page.dart';
import 'package:imc_calculator/repositories/pessoa_repository.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  TextEditingController nomeController = TextEditingController();
  var _pessoas = const <PessoaModel?>[];
  PessoaRepository pessoaRepository = PessoaRepository();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obterPessoas();
  }

  void obterPessoas() async {
    _pessoas = await pessoaRepository.obterPessoas();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Pessoas",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    // Important: Remove any padding from the ListView.
                    padding: EdgeInsets.zero,
                    itemCount: _pessoas.length,
                    itemBuilder: (BuildContext bc, int index) {
                      var pessoa = _pessoas[index];
                      return ListTile(
                        leading: const Icon(
                          Icons.person,
                        ),
                        title: Text(pessoa!.nome),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      HomePage(id: pessoa.id)));
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 0, 30),
            child: Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: InkWell(
                    onTap: () {
                      //Navegar para página
                      showDialog(
                          context: context,
                          builder: (BuildContext bc) {
                            nomeController.text = "";
                            return AlertDialog(
                              title: const Text("Adicionar Pessoa"),
                              content: TextField(
                                controller: nomeController,
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancelar"),
                                ),
                                TextButton(
                                  onPressed: () async {
                                    var pesssoa = PessoaModel(
                                        0, nomeController.text, 0, 0);
                                    await pessoaRepository
                                        .adicionarPessoa(pesssoa);
                                    obterPessoas();
                                    // ignore: use_build_context_synchronously
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                    setState(() {});
                                  },
                                  child: const Text("Salvar"),
                                )
                              ],
                            );
                          });
                    },
                    child: Row(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(right: 15),
                            child: const Icon(Icons.person_add_alt_1)),
                        const Text("Cadastrar nova pessoa"),
                      ],
                    ))),
          ),
        ],
      ),
    );
  }
}
