import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

class StockGraph extends StatelessWidget {
  const StockGraph({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),

          lineBarsData: [
            LineChartBarData(
              color: const Color(0xFF00B86B),

              spots: const [
                FlSpot(0, 100),
                FlSpot(1, 120),
                FlSpot(2, 115),
                FlSpot(3, 145),
                FlSpot(4, 135),
                FlSpot(5, 170),
                FlSpot(6, 160),
                FlSpot(7, 190),
              ],
              isCurved: true,
              barWidth: 3,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFBBD6CB).withOpacity(0.25),
                    const Color(0XFFBBD6CB).withOpacity(0.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
