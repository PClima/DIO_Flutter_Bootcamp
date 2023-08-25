import 'package:flutter/material.dart';
import 'package:trilhaapp/model/card_detail.dart';

class CardDetailPage extends StatelessWidget {
  final CardDetail cardDetail;

  const CardDetailPage({super.key, required this.cardDetail});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: cardDetail.id,
      child: SafeArea(
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.close)),
              Row(
                children: [
                  Image.network(
                    cardDetail.url,
                    height: 100,
                  )
                ],
              ),
              Text(
                cardDetail.title,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
              ),
              Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      cardDetail.text,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    )),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
