import 'package:flutter/material.dart';

class ClientesScreeen extends StatefulWidget {
  const ClientesScreeen({super.key});

  @override
  State<ClientesScreeen> createState() => _ClientesScreeenState();
}

class _ClientesScreeenState extends State<ClientesScreeen> {
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtSobrenome = TextEditingController();
  TextEditingController txtIdade = TextEditingController();

  String resultado = "";

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
          TextField(
            controller: txtNome,
            decoration: InputDecoration(labelText: "Nome"),
          ),
          TextField(
            controller: txtSobrenome,
            decoration: InputDecoration(labelText: "Sobrenome"),
          ),
          TextField(
            controller: txtIdade,
            decoration: InputDecoration(labelText: "Idade"),
          ),
          SizedBox(
            width: double.infinity,
            child: FloatingActionButton(
              child: Text("Carregar"),
              onPressed: () {
                String nome = txtNome.text;
                String idade = txtIdade.text;
                String sobrenome = txtSobrenome.text;

                setState(() {
                  resultado = "Nome: $nome $sobrenome \nIdade: $idade";
                });
              },
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 172, 29, 29),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey),
            ),
            child: Text(
              resultado,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
