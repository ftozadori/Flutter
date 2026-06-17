import 'package:flutter/material.dart';
import 'package:flutter_revisao_v6/jogos_model.dart';
import 'package:flutter_revisao_v6/jogos_service.dart';

class JogosListaScreen extends StatefulWidget {
  const JogosListaScreen({super.key});

  @override
  State<JogosListaScreen> createState() => _JogosListaScreenState();
}

class _JogosListaScreenState extends State<JogosListaScreen> {
   List<JogosModel> jogos = [];

   @override
   void initState(){
    super.initState();

    JogosService().retornarJogos().then(
      (resultado) => setState(() {
        jogos = resultado;
      }),
    );
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        title: Center(child: Text("Lista de Jogos")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: jogos.map((jogos) => retornarItem(jogos)).toList(),
        ),
      ),
    );
  }

  Widget retornarItem(JogosModel? jogos){
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
                padding: EdgeInsets.all(8.0),
                child: Container(
                  height: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(jogos!.urlImagem!, fit: BoxFit.cover),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Nome: ${jogos.nome}"),
                  Text("Nome: ${jogos.dataLancamento}"),
                  Text("Nome: ${jogos.personagemPrincipal}"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}