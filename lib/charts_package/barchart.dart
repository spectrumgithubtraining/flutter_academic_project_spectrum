import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartSample extends StatefulWidget {
  const BarChartSample({super.key});

  @override
  State<BarChartSample> createState() => _BarChartSampleState();
}

class _BarChartSampleState extends State<BarChartSample> {
  // Sample data for the bar chart
  final List<BarChartGroupData> chartData = [
    BarChartGroupData(
      x: 0,
      barRods: [
        BarChartRodData(toY: 3, color: Colors.pink),
      ],
    ),
    BarChartGroupData(
      x: 1,
      barRods: [
        BarChartRodData(toY: 3, color: Colors.green),
      ],
    ),
    BarChartGroupData(
      x: 2,
      barRods: [
        BarChartRodData(toY: 2, color: Colors.blue),
      ],
    ),
    BarChartGroupData(
      x: 3,
      barRods: [
        BarChartRodData(toY: 4, color: Colors.orange),
      ],
    ),
    // ... Add more data points as needed
  ];
  final List<String> days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.bar_chart,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Bar Chart Sample",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        height: 300,
        padding: EdgeInsets.all(16),
        child: BarChart(
          BarChartData(
            gridData: FlGridData(show: true),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    final index = value.toInt();  // Get the index of the current title
                    if (index < days.length) {    // Check if index is within the days list bounds
                      return Text(days[index],style: TextStyle(color: Colors.black,fontSize: 8),);  // Return a Text widget with the corresponding day
                    } else {
                      return Container();        // Return an empty container for values outside the list
                    }
                  },
                ),
              ),
              // ... Right and top titles
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            barGroups: chartData,
            // Ensure minX and maxX match the data points
            maxY: 5,
            minY: 0,
          ),
        ),
      ),
    );
  }
}
