import 'package:flutter/material.dart';

class ClientesScreeen extends StatefulWidget {
  const ClientesScreeen({super.key});

  @override
  State<ClientesScreeen> createState() => _ClientesScreeenState();
}

class _ClientesScreeenState extends State<ClientesScreeen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Cadastro de Clientes")),
        backgroundColor: const Color.fromARGB(255, 172, 29, 29),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          TextField(decoration: InputDecoration(labelText: "Nome")),
          TextField(decoration: InputDecoration(labelText: "Sobrenome")),
          TextField(decoration: InputDecoration(labelText: "Idade")),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton(
              child: Text("Carregar"),
              onPressed: () {},
            ),
          ),
          Text("Nome: Felipe, Sobrenome: Tozadori, Idade: 22"),
        ],
      ),
    );
  }
}
