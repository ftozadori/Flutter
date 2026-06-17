import 'package:flutter/material.dart';

class Veiculo {
  final String fabricante;
  final String modelo;
  final int ano;

  Veiculo({
    required this.fabricante,
    required this.modelo,
    required this.ano,
  });
}

class ListaCarros extends StatefulWidget {
  const ListaCarros({super.key});

  @override
  State<ListaCarros> createState() => _ListaCarrosState();
}

class _ListaCarrosState extends State<ListaCarros> {
  final List<Veiculo> veiculos = [
    Veiculo(fabricante: "Toyota", modelo: "Corolla", ano: 2020),
    Veiculo(fabricante: "Honda", modelo: "Civic", ano: 2019),
    Veiculo(fabricante: "Ford", modelo: "Focus", ano: 2018),
    Veiculo(fabricante: "Chevrolet", modelo: "Onix", ano: 2021),
    Veiculo(fabricante: "Volkswagen", modelo: "Golf", ano: 2017),
    Veiculo(fabricante: "Hyundai", modelo: "HB20", ano: 2022),
    Veiculo(fabricante: "Fiat", modelo: "Argo", ano: 2020),
    Veiculo(fabricante: "Renault", modelo: "Kwid", ano: 2021),
    Veiculo(fabricante: "Nissan", modelo: "Versa", ano: 2019),
    Veiculo(fabricante: "Peugeot", modelo: "208", ano: 2022),
  ];

  List<Veiculo> listaExibida = [];

  void atualizarLista() {
    setState(() {
      listaExibida = List<Veiculo>.from(veiculos);
    });
  }

  void removerVeiculo(int index) {
    setState(() {
      listaExibida.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Listagem de Veículos'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 146, 39, 39),
        foregroundColor: Colors.white,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: atualizarLista,
        backgroundColor: const Color.fromARGB(255, 146, 39, 39),
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: listaExibida.isEmpty
            ? const Center(
                child: Text(
                  'Nenhum veículo carregado.',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: listaExibida.length,
                itemBuilder: (context, index) {
                  final veiculo = listaExibida[index];

                  return Container(
                    height: 100,
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Center(
                              child: Text(
                                'Placeholder',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Fabricante: ${veiculo.fabricante}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Modelo: ${veiculo.modelo}',
                                style: const TextStyle(fontSize: 15),
                              ),
                              Text(
                                'Ano: ${veiculo.ano}',
                                style: const TextStyle(fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () => removerVeiculo(index),
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}