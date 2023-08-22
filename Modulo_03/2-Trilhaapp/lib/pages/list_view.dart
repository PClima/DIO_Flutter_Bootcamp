import 'package:flutter/material.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset("lib/images/user2.png"),
          title: const Text("Usuário 2"),
          subtitle: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Olá! Tudo bem?"),
              Text("08:58"),
            ],
          ),
          trailing: PopupMenuButton<String>(
            onSelected: (menu) {
              debugPrint(menu);
            },
            itemBuilder: (BuildContext bc) {
              return <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                    value: "opção 1", child: Text("Opção 1")),
                const PopupMenuItem<String>(
                    value: "opção 2", child: Text("Opção 2")),
                const PopupMenuItem<String>(
                    value: "opção 3", child: Text("Opção 3"))
              ];
            },
          ),
          isThreeLine: true,
        ),
        Image.asset("lib/images/user1.png"),
        Image.asset("lib/images/user2.png"),
        Image.asset("lib/images/user3.png"),
        Image.asset("lib/images/paisagem1.jpg"),
        Image.asset("lib/images/paisagem2.jpg"),
        Image.asset("lib/images/paisagem3.jpg")
      ],
    );
  }
}
