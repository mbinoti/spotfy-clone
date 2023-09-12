import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Resizable Divider',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _leftContainerWidth = 150; // largura inicial do container da esquerda
  final double _minWidth = 100; // largura mínima do container da esquerda
  final double _maxWidth = 300; // largura máxima do container da esquerda

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Container(
            width: _leftContainerWidth,
            color: Colors.red,
            child: const Center(child: Text('Red Container')),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.resizeLeftRight,
            child: GestureDetector(
              onPanUpdate: (details) {
                setState(() {
                  _leftContainerWidth += details.delta.dx;

                  // Verificando os limites de largura
                  if (_leftContainerWidth < _minWidth) {
                    _leftContainerWidth = _minWidth;
                  } else if (_leftContainerWidth > _maxWidth) {
                    _leftContainerWidth = _maxWidth;
                  }
                });
              },
              child: Container(
                width: 10,
                color: Colors.black,
                height: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Center(child: Text('Blue Container')),
            ),
          ),
        ],
      ),
    );
  }
}
