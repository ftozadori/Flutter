import 'dart:convert' as convert;

import 'package:flutter_revisao_v1/piratas_modal.dart';
import 'package:http/http.dart' as http;

class PiratasService {
  List<PiratasModal> _piratas = [];

  Future<List<PiratasModal>> retornarPiratas() async {
    var response = await http.get(
    Uri.parse("https://mocki.io/v1/c8b91133-ae41-425d-83e8-6592058e1f13"),
    headers: {"Content-Type": "application/json"},
  );
    if (response.statusCode >= 200 && response.statusCode < 400){
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (var jsonPirata in jsonResponse) {
        String? nome = jsonPirata['nome'];
        int? idade = jsonPirata['idade'];
        String? akumaNoMi = jsonPirata['akumaNoMi'];
        String? urlImagem = jsonPirata['urlImagem'];

        PiratasModal piratas = PiratasModal(
          nome: nome,
          idade: idade,
          akumaNoMi: akumaNoMi,
          urlImagem: urlImagem,
        );

        _piratas.add(piratas);
      }
    }
    return _piratas;
  }
}



