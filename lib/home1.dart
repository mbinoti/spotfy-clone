import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela responsiva',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResponsiveScreen(),
    );
  }
}

class ResponsiveScreen extends StatefulWidget {
  @override
  _ResponsiveScreenState createState() => _ResponsiveScreenState();
}

class _ResponsiveScreenState extends State<ResponsiveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 600) {
            return Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  'Mobile',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else if (constraints.maxWidth < 900) {
            return Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  'Tablet',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 209, 77, 77),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'desktop',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 100, 46, 46),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
