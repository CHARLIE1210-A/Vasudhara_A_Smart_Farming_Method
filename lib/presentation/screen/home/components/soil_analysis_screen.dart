import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SoilAnalysisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            PieChartWidget(),
            BarChartWidget(),
            LineChartWidget(),
          ],
        ),
      ),
    );
  }
}

class PieChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<SoilData> data = [
      SoilData('Sand', 40),
      SoilData('Silt', 35),
      SoilData('Clay', 25),
    ];

    return Container(
      margin: const EdgeInsets.all(10),
      child: SfCircularChart(
        title: const ChartTitle(text: 'Soil Composition'),
        legend: const Legend(isVisible: true),
        series: <PieSeries<SoilData, String>>[
          PieSeries<SoilData, String>(
            dataSource: data,
            xValueMapper: (SoilData data, _) => data.component,
            yValueMapper: (SoilData data, _) => data.percentage,
            dataLabelMapper: (SoilData data, _) => '${data.percentage}%',
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class BarChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<NutrientData> data = [
      NutrientData('Nitrogen', 8),
      NutrientData('Phosphorus', 10),
      NutrientData('Potassium', 14),
    ];

    return Container(
      margin: const EdgeInsets.all(10),
      child: SfCartesianChart(
        title: const ChartTitle(text: 'Soil Nutrient Levels'),
        primaryXAxis: const CategoryAxis(),
        primaryYAxis: const NumericAxis(
          labelFormat: '{value}%',
        ),
        series: <CartesianSeries<NutrientData, String>>[
          ColumnSeries<NutrientData, String>(
            dataSource: data,
            xValueMapper: (NutrientData nutrient, _) => nutrient.nutrient,
            yValueMapper: (NutrientData nutrient, _) => nutrient.level,
            name: 'Nutrients',
            dataLabelSettings: DataLabelSettings(isVisible: true),
          )
        ],
      ),
    );
  }
}

class LineChartWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<MoistureData> data = [
      MoistureData(DateTime(2023, 1, 1), 1),
      MoistureData(DateTime(2023, 2, 1), 3),
      MoistureData(DateTime(2023, 3, 1), 2),
      MoistureData(DateTime(2023, 4, 1), 5),
      MoistureData(DateTime(2023, 5, 1), 3),
    ];

    return Container(
      margin: const EdgeInsets.all(10),
      child: SfCartesianChart(
        title: const ChartTitle(text: 'Soil Moisture Over Time'),
        primaryXAxis: const DateTimeAxis(),
        primaryYAxis: const NumericAxis(
          labelFormat: '{value}%',
        ),
        series: <CartesianSeries<MoistureData, DateTime>>[
          LineSeries<MoistureData, DateTime>(
            dataSource: data,
            xValueMapper: (MoistureData data, _) => data.time,
            yValueMapper: (MoistureData data, _) => data.moisture,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
          ),
        ],
      ),
    );
  }
}

class SoilData {
  final String component;
  final double percentage;
  SoilData(this.component, this.percentage);
}

class NutrientData {
  final String nutrient;
  final double level;
  NutrientData(this.nutrient, this.level);
}

class MoistureData {
  final DateTime time;
  final double moisture;
  MoistureData(this.time, this.moisture);
}
