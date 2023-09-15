import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'spot-clone',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        var widthForContainerRed = 200.0;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  // height: constraints.maxHeight,
                  color: Colors.yellow,
                  width: 100,
                ),
              ),
            ),
            if (constraints.maxHeight >= 100)
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 90,
                    width: constraints.maxWidth,
                    color: Colors.red,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}

class menuLateral extends StatelessWidget {
  var constraints;

  menuLateral({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          //
          Container(
            width: 300,
            height: constraints.maxHeight,
            color: Color.fromARGB(255, 222, 212, 208),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildGreen(),
                const SizedBox(height: 5.0), // espaço entre os items
                buildGreen(),
                const SizedBox(height: 5.0), // espaço entre os items
                // Você pode adicionar quantos buildGreenContainer() quiser
              ],
            ),
          ),
          // adicionar o mouseregion com divisor apenas quando mouse estiver na rea.
          // MouseRegion(
          //   cursor: SystemMouseCursors.resizeLeftRight,
          //   child: GestureDetector(
          //     onHorizontalDragUpdate: (details) {
          //       // Se o usuário arrastar o mouse para a esquerda, o valor será negativo.
          //       // Se o usuário arrastar o mouse para a direita, o valor será positivo.
          //       double newValue = widthForFirstContainer + details.delta.dx;

          //       // Se o valor for menor que 0, use 0.
          //       // Se o valor for maior que maxWidthForFirstArea2, use maxWidthForFirstArea2.
          //       if (newValue < 0) {
          //         newValue = 0;
          //       } else if (newValue > maxWidthForFirstArea2) {
          //         newValue = maxWidthForFirstArea2;
          //       }

          //       // Atualize a largura do container.
          //       widthForFirstContainer = newValue;
          //     },
          //     child: Container(
          //       width: 10.0,
          //       color: Colors.white,
          //     ),
          //   ),
          // ),

          // Expanded(
          //   child: Container(
          //     margin: const EdgeInsets.all(14.0),
          //     decoration: BoxDecoration(
          //       color: Colors.yellow,
          //       borderRadius: BorderRadius.circular(10.0),
          //     ),
          //   ),
          // ),
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
}
