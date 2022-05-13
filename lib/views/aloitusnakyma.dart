import 'package:flutter/material.dart';
import 'package:flutter_kyselysovellus/components/tervehdysteksti.dart';
import 'package:flutter_kyselysovellus/storage/kayttajatiedot.dart';

class Aloitusnakyma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final teksti = Tervehdysteksti();

    final nappi = ElevatedButton(
        child: Text('Kysy kysymys'),
        onPressed: () => Navigator.pushNamed(context, '/kysely'));

    final sarake = Column(children: [teksti, nappi]);

    return Scaffold(body: SafeArea(child: sarake));
  }
}
