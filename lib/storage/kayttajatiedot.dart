import 'package:shared_preferences/shared_preferences.dart';

class Kayttajatiedot {
  tuttuKayttaja() async {
    SharedPreferences asetukset = await SharedPreferences.getInstance();
    var tuttuKayttaja = asetukset.constantKey('TUTTU_KAYTTAJA');
    asetukset.setString('TUTTU_KAYTTAJA', 'KYLLA');

    return tuttuKayttaja;
  }
}
