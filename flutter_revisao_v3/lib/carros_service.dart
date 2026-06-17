import 'dart:convert' as convert;

import 'package:flutter_revisao_v3/carros_model.dart';
import 'package:http/http.dart' as http;

class CarrosService {
  List<CarrosModel> _carros = [];

  Future<List<CarrosModel>> retornarCarros() async {
    var response = await http.get(
      Uri.parse("https://mocki.io/v1/f05b7a8e-2378-40b1-a00e-4d5ceb75f0fc"),
      headers: {"content-type": "application.json"},
    );

    if (response.statusCode >= 200 && response.statusCode < 400){
      var jsonResponse = convert.jsonDecode(response.body) as List<dynamic>;

      for (var jsonCarros in jsonResponse){
        String? nome = jsonCarros["nome"];
        String? ano = jsonCarros["ano"];
        String? marca = jsonCarros["marca"];
        String? urlImagem = jsonCarros["urlImagem"];

        CarrosModel carros = CarrosModel(
          nome: nome,
          ano: ano,
          marca: marca,
          urlImagem: urlImagem, 
        );

        _carros.add(carros);
      }
    }

    return _carros;
  }
}