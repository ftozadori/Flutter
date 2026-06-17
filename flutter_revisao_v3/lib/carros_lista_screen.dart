import 'package:flutter/material.dart';
import 'package:flutter_revisao_v3/carros_model.dart';
import 'package:flutter_revisao_v3/carros_service.dart';
import 'package:http/http.dart';

class CarrosListaScreen extends StatefulWidget {
  const CarrosListaScreen({super.key});

  @override
  State<CarrosListaScreen> createState() => _CarrosListaScreenState();
}

class _CarrosListaScreenState extends State<CarrosListaScreen> {
  List<CarrosModel> carros = [];

  @override
  void initState(){
    super.initState();

    CarrosService().retornarCarros().then(
      (resultado) => setState(() {
        carros = resultado;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(child: Text("Lista de Carros")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: carros.map((carros) => retornarItem(carros)).toList(),
        ),
      ),
    );
  }

    Widget retornarItem(CarrosModel? carros){
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: double.infinity,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      carros!.urlImagem ?? '',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.broken_image, size: 40),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome: ${carros.nome}"),
                    Text("Nome: ${carros.ano}"),
                    Text("Nome: ${carros.marca}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}
