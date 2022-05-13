import 'package:flutter/material.dart';
import 'package:flutter_kyselysovellus/storage/kayttajatiedot.dart';

class Aloitusnakyma extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final teksti = FutureBuilder(
        future: Kayttajatiedot().tuttuKayttaja(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data) {
              return Text('Hei taas!');
            } else {
              return Text('Tervetuloa uusi käyttäjä!');
            }
          } else if (snapshot.hasError) {
            return Text('Käyttäjätietojen hakemisessa tapahtui virhe.');
          } else {
            return Text('Haetaan käyttäjätietoja.');
          }
        });

    final nappi = ElevatedButton(
        child: Text('Kysy kysymys'),
        onPressed: () => Navigator.pushNamed(context, '/kysely'));

    final sarake = Column(children: [teksti, nappi]);

    return Scaffold(body: SafeArea(child: sarake));
  }
}
