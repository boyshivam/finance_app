import "package:aprreciate/core/themes/app_theme/app_colors/app_colors_common.dart";
import "package:aprreciate/models/stocks_model/stock_card_model.dart";
import "package:fl_chart/fl_chart.dart";
import "package:flutter/material.dart";

class StockGraph extends StatelessWidget {
  const StockGraph({super.key, required this.selectedSecurity});

  final StockCardModel selectedSecurity;

  @override
  Widget build(BuildContext context) {
    final isChangeNegative =
        selectedSecurity.valueChange < 0 ||
        selectedSecurity.valueChangePerc < 0;

    return SizedBox(
      height: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            selectedSecurity.value.toStringAsFixed(2),
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: AppColorsCommon.positiveGreen,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "\$${selectedSecurity.valueChange} ${(selectedSecurity.valueChangePerc)}%",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              fontSize: 20,
              color: isChangeNegative
                  ? AppColorsCommon.appreciateThemeError
                  : AppColorsCommon.positiveGreen,
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: LineChart(
              LineChartData(
                gridData: const FlGridData(show: false),
                titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
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
          ),
        ],
      ),
    );
  }
}
