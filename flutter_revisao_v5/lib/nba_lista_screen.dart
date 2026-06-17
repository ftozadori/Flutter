import 'package:flutter/material.dart';
import 'package:flutter_revisao_v5/nba_model.dart';
import 'package:flutter_revisao_v5/nba_service.dart';

class NbaListaScreen extends StatefulWidget {
  const NbaListaScreen({super.key});

  @override
  State<NbaListaScreen> createState() => _NbaListaScreenState();
}

class _NbaListaScreenState extends State<NbaListaScreen> {
  List<NbaModel> nba = [];

  @override
  void initState(){
    super.initState();

    NbaService().retornarNba().then(
      (resultado) => setState(() {
        nba = resultado;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(child: Text("Lista NBA")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: nba.map((nba) => retornarItem(nba)).toList(),
        ),
      ),
    );
  }

  Widget retornarItem(NbaModel? nba) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsetsGeometry.all(8.0),
                child: Container(
                  height: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(nba!.urlImagem!, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Time: ${nba.time}"),
                  Text("Time: ${nba.titulos}"),
                  Text("Time: ${nba.melhorJogador}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}