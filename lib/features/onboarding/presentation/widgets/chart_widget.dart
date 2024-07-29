import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
        legend: const Legend(isVisible: true,position: LegendPosition.right),
        series: <CircularSeries>[
          // Initialize line series
          PieSeries<ChartData, String>(
              dataSource: [
                ChartData('Sensor', 25),
                ChartData('Gateway', 38),
                ChartData('Package', 34),
                ChartData('Others', 12)
              ],
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y,
              // Render the data label
              dataLabelSettings:const DataLabelSettings(isVisible : true)
          )
        ]
    );
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double y;
}