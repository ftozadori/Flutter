import 'package:flutter/material.dart';
import 'package:flutter_lista/contato.dart';

class Contatoslistascreen extends StatefulWidget {
  const Contatoslistascreen({super.key});

  @override
  State<Contatoslistascreen> createState() => _ContatoslistascreenState();
}

class _ContatoslistascreenState extends State<Contatoslistascreen> {
  List<Contato> contatos = [
    Contato(id: 1, nome: "William", sobrenome: "Guimarães"),
    Contato(id: 2, nome: "Ana", sobrenome: "Clara"),
    Contato(id: 3, nome: "Felipe", sobrenome: "Assis"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
        title: Center(child: Text("Contato: Lista")),
      ),

      body: Column(
        children: contatos.map((contato) {
          return Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.amber,
              border: Border.all(color: Colors.black, width: 1),
            ),

            child: Row(
              children: [
                Expanded(flex: 1, child: Text(contato.id.toString())),
                Expanded(flex: 1, child: Text(
                  '${contato.nome} ${contato.sobrenome}')
                  ),
                Expanded(flex: 1, 
                child: IconButton(onPressed: () 
                {}, icon: Icon(Icons.delete))),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
