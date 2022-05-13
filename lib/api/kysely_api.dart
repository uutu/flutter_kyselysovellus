import 'dart:convert';
import 'package:http/http.dart';
import '../storage/kayttajatiedot.dart';

class KyselyApi {
  luoTunnus() async {
    var response =
        await get(Uri.parse('https://deno-quiz-api.herokuapp.com/users/new'));

    var sanakirja = jsonDecode(response.body);
    return sanakirja['userId'];
  }

  haeKysymys() async {
    var tunnus = await haeTunnus();
    var response = await get(Uri.parse(
        'https://deno-quiz-api.herokuapp.com/questions?userId=$tunnus'));

    return jsonDecode(response.body);
  }

  haeTunnus() async {
    var onTunnus = await Kayttajatiedot().onTunnus();
    if (!onTunnus) {
      var tunnus = await luoTunnus();
      await Kayttajatiedot().asetaTunnus(tunnus);
    }

    return await Kayttajatiedot().haeTunnus();
  }

  lahetaVastaus(questionId, answerOptionId) async {
    var tunnus = await haeTunnus();
    var data = {
      "userId": tunnus,
      "questionId": questionId,
      "answerOptionId": answerOptionId
    };

    var response = await post(
        Uri.parse('https://deno-quiz-api.herokuapp.com/answers'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data));

    var sanakirja = jsonDecode(response.body);

    return sanakirja['correct'];
  }
}
