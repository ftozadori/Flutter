import 'dart:convert' as convert;

import 'package:flutter_revisao_v5/nba_model.dart';
import 'package:http/http.dart' as http;

class NbaService {
  List<NbaModel> _nba = [];

  Future<List<NbaModel>> retornarNba() async {
    var response = await http.get(
      Uri.parse("https://mocki.io/v1/31e57206-fe46-4108-8ac1-f5190120c1dd"),
      headers: {"content-type": "application.json"},
    );

    if(response.statusCode >= 200 && response.statusCode < 400){
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (var jsonNba in jsonResponse){
        String? time = jsonNba["time"];
        int? titulos = jsonNba["titulos"];
        String? melhorJogador = jsonNba["melhorJogador"];
        String? urlImagem = jsonNba["urlImagem"];

        NbaModel nba = NbaModel(
          time: time,
          titulos: titulos,
          melhorJogador: melhorJogador,
          urlImagem: urlImagem,
        );

        _nba.add(nba);
      }
    }
    return _nba;
  }
}