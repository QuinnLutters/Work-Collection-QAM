// summary_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:virtual_buddy_app_design/widgets/bar_chart_widget.dart';
import 'package:virtual_buddy_app_design/widgets/circular_progress_indicator.dart';
import 'package:virtual_buddy_app_design/widgets/bpm_chart.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(253, 253, 255, 1),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 60),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15.0,
                crossAxisSpacing: 15.0,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(229, 229, 229, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BPMChartWidget(),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(229, 229, 229, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(
                        child: CircularProgressIndicatorWidget(percentage: 0.75),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 1,
                    mainAxisCellCount: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(253, 253, 255, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 2,
                    mainAxisCellCount: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(229, 229, 229, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: BarChartWidget(), 
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 40,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromRGBO(253, 253, 255, 0),
                    Color.fromRGBO(253, 253, 255, 1),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
