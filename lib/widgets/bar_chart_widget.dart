import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class BarChartWidget extends StatelessWidget {
  const BarChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 10,
        titlesData: FlTitlesData(
          show: true,
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (double value, TitleMeta meta) {
                const style = TextStyle(
                  color: Color.fromRGBO(31, 31, 31, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                );
                Widget text;
                switch (value.toInt()) {
                  case 0:
                    text = const Text('M', style: style);
                    break;
                  case 1:
                    text = const Text('T', style: style);
                    break;
                  case 2:
                    text = const Text('W', style: style);
                    break;
                  case 3:
                    text = const Text('T', style: style);
                    break;
                  case 4:
                    text = const Text('F', style: style);
                    break;
                  case 5:
                    text = const Text('S', style: style);
                    break;
                  case 6:
                    text = const Text('S', style: style);
                    break;
                  default:
                    text = const Text('', style: style);
                    break;
                }
                return SideTitleWidget(
                  axisSide: meta.axisSide,
                  child: text,
                );
              },
              reservedSize: 28,
            ),
          ),
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(
          show: false,
        ),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 3,
                color: const Color.fromRGBO(241, 208, 10, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 5,
                color: const Color.fromRGBO(33, 50, 94, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 8,
                color: const Color.fromRGBO(241, 208, 10, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 7,
                color: const Color.fromRGBO(33, 50, 94, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 4,
                color: const Color.fromRGBO(241, 208, 10, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          BarChartGroupData(
            x: 5,
            barRods: [
              BarChartRodData(
                toY: 5,
                color: const Color.fromRGBO(33, 50, 94, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          BarChartGroupData(
            x: 6,
            barRods: [
              BarChartRodData(
                toY: 6,
                color: const Color.fromRGBO(241, 208, 10, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
          BarChartGroupData(
            x: 7
            ,
            barRods: [
              BarChartRodData(
                toY: 3,
                color: const Color.fromRGBO(33, 50, 94, 1),
                width: 22,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
