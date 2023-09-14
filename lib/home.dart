import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MinhaTela(),
    );
  }
}

class MinhaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Para a Row responsiva
          Expanded(
            child: Row(
              children: [
                // Container azul ocupando 20% do espaço
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                    maxWidth: 200,
                  ),
                  child: Container(
                    color: Colors.blue,
                    width: MediaQuery.of(context).size.width * 0.30,
                    child: Column(
                      children: [
                        buildGreen(),
                        const SizedBox(height: 5),
                        Expanded(child: buildGreenWithList()),
                      ],
                    ),
                  ),
                ),
                // Container verde ocupando 80% do espaço
                Flexible(
                  flex: 8,
                  child:
                      Container(color: const Color.fromARGB(255, 152, 214, 35)),
                ),
              ],
            ),
          ),
          // Para o Container vermelho de altura 90px na parte inferior
          Container(
            height: 90,
            color: Colors.red,
          ),
        ],
      ),
    );
  }

  Widget buildGreen() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 20, 147, 30),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 8.0),
                Text('Inicio', style: TextStyle(color: Colors.white)),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 8.0),
                Text('Buscar', style: TextStyle(color: Colors.white)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildGreenWithList() {
    return Container(
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(221, 20, 147, 30),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        children: [
          // Itens fixos
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 8.0),
                Text('Inicio', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.search, color: Colors.white),
                SizedBox(width: 8.0),
                Text('Buscar', style: TextStyle(color: Colors.white)),
              ],
            ),
          ),

          // Espaço entre os itens fixos e a lista
          const SizedBox(height: 10.0),

          // Lista que ocupa o restante do espaço
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ListTile(title: Text('Item $index'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
