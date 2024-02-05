import 'package:flutter/material.dart';
import 'package:flutter_academic_project_spectrum/charts_package/line_chart.dart';
import 'package:flutter_academic_project_spectrum/charts_package/pie_chart.dart';

import 'barchart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Chart',
      home: PieChartSample(),
    );
  }
}
