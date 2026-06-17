import 'dart:convert' as convert;

import 'package:flutter_revisao_v6/jogos_model.dart';
import 'package:http/http.dart' as http;


class JogosService {
  List<JogosModel> _jogos = [];

  Future<List<JogosModel>> retornarJogos() async {
    var response = await http.get(
      Uri.parse("https://mocki.io/v1/55f413d8-7b04-42ea-a466-a5af97c52f58"),
      headers: {"content-type": "application.json"},
    );

    if (response.statusCode >= 200 && response.statusCode < 400){
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for(var jsonJogos in jsonResponse){
        String? nome = jsonJogos["nome"];
        int? dataLancamento = jsonJogos["dataLancamento"];
        String? personagemPrincipal = jsonJogos["personagemPrincipal"];
        String? urlImagem = jsonJogos["urlImagem"];

        JogosModel jogos = JogosModel(
          nome: nome,
          dataLancamento: dataLancamento,
          personagemPrincipal: personagemPrincipal,
          urlImagem: urlImagem,
        );

        _jogos.add(jogos); 
      }
    }

    return _jogos;
  }
}