import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'spot',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: MenuBar(),
      ),
    );
  }
}

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double cyanContainerHeight = constraints.maxHeight * 0.10;

        // Definindo a largura máxima que o primeiro container pode ter.
        double maxWidthForFirstContainer =
            MediaQuery.of(context).size.width * 0.15;

        // Se o constraints.maxWidth * 0.2 for maior que maxWidthForFirstContainer,
        // use maxWidthForFirstContainer.
        double widthForFirstContainer =
            (constraints.maxWidth * 0.2) > maxWidthForFirstContainer
                ? maxWidthForFirstContainer
                : constraints.maxWidth * 0.15;

        return Column(
          children: [
            Expanded(
              child: NewWidget(
                widthForFirstContainer: widthForFirstContainer,
                maxWidthForFirstContainer: maxWidthForFirstContainer,
              ),
            ),
            Container(
              height: cyanContainerHeight,
              color: Colors.cyanAccent,
            ),
          ],
        );
      },
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key? key,
    required this.widthForFirstContainer,
    required this.maxWidthForFirstContainer,
  }) : super(key: key);

  final double widthForFirstContainer;
  final double maxWidthForFirstContainer;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // container 1
        Container(
          width: widthForFirstContainer,
          color: const Color.fromARGB(255, 198, 169, 159),
          child: OverflowBox(
            maxWidth: maxWidthForFirstContainer,
            // maxHeight: maxHeightForOverflowBox,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                buildGreenContainer(),
                // const SizedBox(height: 10.0), // espaço entre os items
                Expanded(child: buildGreenContainer()),
                // const SizedBox(height: 10.0), // espaço entre os items
                // Você pode adicionar quantos buildGreenContainer() quiser
              ],
            ),
          ),
        ),
        // expanded container
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(14.0),
            decoration: BoxDecoration(
              color: Colors.yellowAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ],
    );
  }

  // Este é o método reutilizável para construir o container verde.
  Widget buildGreenContainer() {
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
