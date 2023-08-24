import 'package:flutter/material.dart';

class ListViewH extends StatefulWidget {
  const ListViewH({super.key});

  @override
  State<ListViewH> createState() => _ListViewHState();
}

class _ListViewHState extends State<ListViewH> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: ListView(scrollDirection: Axis.horizontal, children: [
              Card(
                elevation: 9,
                child: Image.asset(
                  "lib/images/paisagem1.jpg",
                ),
              ),
              Card(
                elevation: 9,
                child: Image.asset(
                  "lib/images/paisagem2.jpg",
                ),
              ),
              Card(
                elevation: 9,
                child: Image.asset(
                  "lib/images/paisagem3.jpg",
                ),
              )
            ]),
          ),
          Expanded(
            flex: 3,
            child: Container(),
          )
        ],
      ),
    );
  }
}
