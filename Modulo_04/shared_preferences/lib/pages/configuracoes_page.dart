import 'package:flutter/material.dart';
import 'package:trilhaapp/service/app_storage.dart';

class ConfiguracoesPage extends StatefulWidget {
  const ConfiguracoesPage({super.key});

  @override
  State<ConfiguracoesPage> createState() => _ConfiguracoesPageState();
}

class _ConfiguracoesPageState extends State<ConfiguracoesPage> {
  AppStorageService storage = AppStorageService();

  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String? nomeUsuario;
  double? altura;
  bool receberPushNotification = false;
  bool darkMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    nomeUsuarioController.text = await storage.getConfiguracoesNomeUsuario();
    alturaController.text =
        (await (storage.getConfiguracoesAltura())).toString();
    receberPushNotification =
        await storage.getConfiguracoesReceberNotificacoes();
    darkMode = await storage.getConfiguracoesDarkMode();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Configurações"),
        ),
        body: Container(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  decoration:
                      const InputDecoration(hintText: "Nome do Usuário"),
                  controller: nomeUsuarioController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  onTapOutside: (event) {
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(hintText: "Altura"),
                  controller: alturaController,
                ),
              ),
              SwitchListTile(
                  title: const Text("Receber Notificações"),
                  value: receberPushNotification,
                  onChanged: (bool value) {
                    setState(() {
                      receberPushNotification = value;
                    });
                  }),
              const Divider(),
              SwitchListTile(
                  title: const Text("Tema Escuro"),
                  value: darkMode,
                  onChanged: (bool value) {
                    setState(() {
                      darkMode = value;
                    });
                  }),
              TextButton(
                  onPressed: () async {
                    try {
                      await storage.setConfiguracoesAltura(
                          double.parse(alturaController.text));
                    } catch (e) {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return AlertDialog(
                              title: const Text("Meu App"),
                              content: const Text(
                                  "Favor informar uma altura válida"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("Ok"))
                              ],
                            );
                          });
                      return;
                    }
                    await storage.setConfiguracoesNomeUsuario(
                        nomeUsuarioController.text);
                    await storage.setConfiguracoesReceberNotificacoes(
                        receberPushNotification);
                    await storage.setConfiguracoesDarkMode(darkMode);

                    Navigator.pop(context);
                  },
                  child: const Text("Salvar"))
            ],
          ),
        ),
      ),
    );
  }
}
