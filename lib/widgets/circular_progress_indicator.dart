import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class CircularProgressIndicatorWidget extends StatelessWidget {
  final double percentage;

  const CircularProgressIndicatorWidget({required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      child: Stack(
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CircularPercentIndicator(
                radius: 50.0,
                lineWidth: 7.0,
                percent: percentage,
                center: Text(
                  '${(percentage * 100).toInt()}%',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Color.fromRGBO(253, 253, 255, 1),
                  ),
                ),
                progressColor: const Color.fromRGBO(241, 208, 10, 1),
                backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
                fillColor: const Color.fromRGBO(31, 31, 31, 1),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
