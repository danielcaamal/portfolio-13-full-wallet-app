import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PortfolioCharts extends StatefulWidget {
  const PortfolioCharts({
    super.key,
  });

  @override
  State<PortfolioCharts> createState() => _PortfolioChartsState();
}

class _PortfolioChartsState extends State<PortfolioCharts> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: _PortfolioCentralChart(
            expenses: 2500,
            incomes: 2500,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: 150,
              height: 150,
              child: _PortfolioCentralChart(
                expenses: 2500,
                incomes: 7890,
              ),
            ),
            SizedBox(
              width: 150,
              height: 150,
              child: _PortfolioCentralChart(
                expenses: 7890,
                incomes: 2500,
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _PortfolioCentralChart extends StatelessWidget {
  final double expenses;
  final double incomes;

  const _PortfolioCentralChart({
    this.expenses = 50.0,
    this.incomes = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        startDegreeOffset: -90.0,
        sections: [
          _portfolioCentralChartSectionData(
              color: Colors.redAccent, title: 'Expenses', value: expenses),
          _portfolioCentralChartSectionData(
              color: Colors.blueAccent, title: 'Incomes', value: incomes),
        ],
      ),
      swapAnimationCurve: Curves.easeInOut,
      swapAnimationDuration: const Duration(milliseconds: 500),
    );
  }

  PieChartSectionData _portfolioCentralChartSectionData(
      {required Color color, required String title, required double value}) {
    return PieChartSectionData(
      color: color,
      title: title,
      value: value,
      radius: 70,
      titleStyle: const TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xffffffff)),
    );
  }
}
