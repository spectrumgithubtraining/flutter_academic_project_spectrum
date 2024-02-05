import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class PieChartSample extends StatefulWidget {
  const PieChartSample({Key? key}) : super(key: key);

  @override
  State<PieChartSample> createState() => _PieChartSampleState();
}

class _PieChartSampleState extends State<PieChartSample> {
  // Sample data for the pie chart
  final List<PieChartSectionData> pieChartData = [
    PieChartSectionData(
      value: 30,
      color: Colors.blueAccent,
      title: 'Category 1',
      radius: 100,
    ),
    PieChartSectionData(
      value: 10,
      color: Colors.green,
      title: 'Category 2',
      radius: 100,
    ),
    PieChartSectionData(
      value: 60,
      color: Colors.orange,
      title: 'Category 3',
      radius: 100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ... AppBar and other widgets
      body: Container(
        width: double.infinity,
        height: 300,
        padding: EdgeInsets.all(16),
        child: PieChart(
          PieChartData(
            sections: pieChartData,
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey, width: 1),
            ),
            pieTouchData: PieTouchData(
              enabled: true,
            ),
            // Additional customization options
            centerSpaceRadius: 40, // Adjust the size of the center hole
          ),
        ),
      ),
    );
  }
}
