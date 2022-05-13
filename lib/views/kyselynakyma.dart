import 'package:flutter/material.dart';
import '../api/kysely_api.dart';
import '../components/kysymys.dart';
import '../components/palaute.dart';

class Kyselynakyma extends StatefulWidget {
  @override
  KyselynakymaState createState() => KyselynakymaState();
}

class KyselynakymaState extends State {
  var kysymysSanakirja;

  var kysymys;
  var vastattu = false;
  var vastausOikein = false;

  @override
  initState() {
    super.initState();
    haeKysymys();
  }

  haeKysymys() async {
    kysymysSanakirja = await KyselyApi().haeKysymys();
    vastattu = false;

    paivita();
  }

  vastaaKysymykseen(kysymysTunnus, vastausTunnus) async {
    vastausOikein =
        await KyselyApi().lahetaVastaus(kysymysTunnus, vastausTunnus);
    vastattu = true;
    paivita();
  }

  paivita() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (kysymysSanakirja == null) {
      return Scaffold(body: SafeArea(child: Text('Kysymystä haetaan')));
    }
    if (vastattu) {
      return Scaffold(body: Palaute(vastausOikein, haeKysymys));
    } else {
      return Scaffold(body: Kysymys(kysymysSanakirja, vastaaKysymykseen));
    }
    return Scaffold(
        body: SafeArea(child: Kysymys(kysymysSanakirja, vastaaKysymykseen)));
  }
}
