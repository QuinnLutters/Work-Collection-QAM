// chart.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class SensorValue {
  final double value;
  final DateTime time;

  SensorValue({required this.value, required this.time});
}

class BPMChartWidget extends StatelessWidget {
  const BPMChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<SensorValue> data = generateDummyData();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.transparent),
      ),
      height: 200, 
      padding: const EdgeInsets.all(16.0),
      child: Stack(
        children: [
          LineChart(
            LineChartData(
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              lineBarsData: [
                LineChartBarData(
                  spots: data
                      .asMap()
                      .entries
                      .map((entry) => FlSpot(entry.key.toDouble(), entry.value.value))
                      .toList(),
                  isCurved: true,
                  color: const Color.fromRGBO(33, 50, 94, 1), 
                  dotData: const FlDotData(show: false),
                  belowBarData: BarAreaData(show: false),
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Text(
              'BPM: ${data.last.value.toInt()}',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<SensorValue> generateDummyData() {
    // Generate dummy SensorValue data for demonstration
    List<SensorValue> dummyData = [];
    DateTime now = DateTime.now();
    double baseValue = 60.0; // Base BPM value
    double amplitude = 10.0; // Amplitude of variation

    // Generate random variations in BPM values
    Random random = Random();
    for (int i = 0; i < 100; i++) {
      double randomValue = baseValue +
          amplitude * (random.nextDouble() * 2 - 1) + // Randomly fluctuate within amplitude
          i.toDouble(); // Gradual increase
      dummyData.add(SensorValue(
        value: randomValue,
        time: now.subtract(Duration(minutes: i)),
      ));
    }
    return dummyData;
  }
}
