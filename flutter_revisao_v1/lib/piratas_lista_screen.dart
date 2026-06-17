import 'package:flutter/material.dart';
import 'package:flutter_revisao_v1/piratas_modal.dart';
import 'package:flutter_revisao_v1/piratas_service.dart';

class PiratasListaScreen extends StatefulWidget {
  const PiratasListaScreen({super.key});

  @override
  State<PiratasListaScreen> createState() => _PiratasListaScreenState();
}

class _PiratasListaScreenState extends State<PiratasListaScreen> {
  List<PiratasModal> piratas = [];
  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();

    PiratasService().retornarPiratas().then(
      (resultado) => setState(() {
        piratas = resultado;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 77, 67),
        foregroundColor: Colors.white,
        title: const Text("Lista De Piratas"),
      ),
      body: carregando
          ? const Center(child: CircularProgressIndicator())
          : erro != null
              ? Center(child: Text("Erro: $erro"))
              : SingleChildScrollView(
                  child: Column(
                    children: piratas.map((p) => retornarItem(p)).toList(),
                  ),
                ),
    );
  }

    Widget retornarItem(PiratasModal? piratas) {
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
                      piratas!.urlImagem!, 
                      fit: BoxFit.cover),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Nome: ${piratas.nome}"),
                    Text("Idade: ${piratas.idade}"),
                    Text("Akuma No Mi: ${piratas.akumaNoMi}"),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    }
}
