import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';
import 'package:trilhaapp/pages/card_detail.dart';
import 'package:trilhaapp/repositories/card_detail_repository.dart';

class CardPage extends StatefulWidget {
  const CardPage({super.key});

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  CardDetail? cardDetail;
  CardDetailRepository cardDetailRepository = CardDetailRepository();

  @override
  void initState() {
    super.initState();
    carregarDados();
  }

  void carregarDados() async {
    cardDetail = await cardDetailRepository.get();
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: double.infinity,
          child: cardDetail == null
              ? const LinearProgressIndicator()
              : Hero(
                  tag: cardDetail!.id,
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8)),
                        Row(
                          children: [
                            Image.network(
                              cardDetail!.url,
                              height: 20,
                            ),
                            Text(
                              cardDetail!.title,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          ],
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              cardDetail!.text,
                              style: const TextStyle(fontSize: 16),
                              textAlign: TextAlign.justify,
                            )),
                        Container(
                            width: double.infinity,
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CardDetailPage(
                                              cardDetail: cardDetail!)));
                                },
                                child: const Text(
                                  "Ler Mais",
                                  style: TextStyle(
                                      decoration: TextDecoration.underline),
                                )))
                      ],
                    ),
                  ),
                ),
        ),
      ],
    );
  }
}
