import 'package:flutter/material.dart';
import 'package:flutter_revisao_v1/piratas_lista_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: PiratasListaScreen(),
    );
  }
}

