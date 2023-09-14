import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela Responsiva',
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
  double blueWidth = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder:
                  (BuildContext outerContext, BoxConstraints outerConstraints) {
                if (outerConstraints.maxWidth < 70) {
                  return Container(width: 50, color: Colors.yellow);
                }

                return Row(
                  children: [
                    LayoutBuilder(
                      builder: (BuildContext innerContext,
                          BoxConstraints innerConstraints) {
                        return Container(
                          width: outerConstraints.maxWidth - blueWidth,
                          color: Colors.blue,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text('${innerConstraints.maxWidth}'),
                          ),
                        );
                      },
                    ),
                    GestureDetector(
                      onPanUpdate: (details) {
                        setState(() {
                          blueWidth += details.delta.dx;
                        });
                      },
                      child: MouseRegion(
                        cursor: SystemMouseCursors.resizeLeftRight,
                        child: Container(width: 5, color: Colors.transparent),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('${outerConstraints.maxWidth}'),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(height: 90, color: Colors.red),
        ],
      ),
    );
  }
}
