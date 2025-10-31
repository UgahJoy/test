import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/my_line_chart.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: Scaffold(body: SafeArea(child: LineChartSample2())),
    );
  }
}







/* */