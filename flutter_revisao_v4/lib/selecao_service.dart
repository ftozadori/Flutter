import 'dart:convert' as convert;

import 'package:flutter_revisao_v4/selecao_model.dart';
import 'package:http/http.dart' as http;

class SelecaoService {
  List<SelecaoModel> _selecao = [];

  Future<List<SelecaoModel>> retornarSelecao() async {
    var response = await http.get(
      Uri.parse("https://mocki.io/v1/4e8dc31a-368f-487b-84fa-6d3bca70d9b9"),
      headers: {"content-type": "application.json",}
    );

    if (response.statusCode >= 200 && response.statusCode < 400){
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (var jsonSelecao in jsonResponse) {
        String? nome = jsonSelecao["nome"];
        String? time = jsonSelecao["time"];
        int? idade = jsonSelecao["idade"];
        String? urlImagem = jsonSelecao["urlImagem"];

        SelecaoModel selecao = SelecaoModel(
          nome: nome,
          time: time,
          idade: idade,
          urlImagem: urlImagem,
        );
        _selecao.add(selecao);
      }
    }

    return _selecao;
  }
}