import 'package:flutter/material.dart';
import 'package:flutter_revisao_v4/selecao_model.dart';
import 'package:flutter_revisao_v4/selecao_service.dart';

class SelecaoListaScreen extends StatefulWidget {
  const SelecaoListaScreen({super.key});

  @override
  State<SelecaoListaScreen> createState() => _SelecaoListaScreenState();
}

class _SelecaoListaScreenState extends State<SelecaoListaScreen> {
  List<SelecaoModel> selecao = [];

  @override
  void initState() {
    super.initState();

    SelecaoService().retornarSelecao().then(
      (resultado) => setState(() {
        selecao = resultado;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        title: Center(child: Text("Lista da Selecao")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: selecao.map((selecao) => retornarItem(selecao)).toList(),
        ),
      ),
    );
  }

  Widget retornarItem(SelecaoModel? selecao) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.green, width: 1),
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
                  child: Image.network(selecao!.urlImagem!, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome: ${selecao.nome}"),
                  Text("Nome: ${selecao.time}"),
                  Text("Nome: ${selecao.idade}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  } 
}