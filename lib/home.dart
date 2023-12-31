import 'package:flutter/material.dart';

void main() => runApp(MeuApp());

class MeuApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
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
          Expanded(
            child: Row(
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(
                    minWidth: 200,
                    maxWidth: 200,
                  ),
                  child: Container(
                    color: const Color.fromARGB(255, 69, 72, 75),
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
                      Container(color: const Color.fromARGB(255, 152, 201, 59)),
                ),
              ],
            ),
          ),
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

          const SizedBox(height: 10.0),

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
