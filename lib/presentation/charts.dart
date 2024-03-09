import 'package:airbyteconnect/theme/app_colors.dart';
import 'package:airbyteconnect/models/branch_models.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  const Charts({super.key, required this.weekDataList});

  final List<WeekData> weekDataList;
  final pilateColor = AppColors.contentColorPurple;

  final cyclingColor = AppColors.contentColorCyan;

  final quickWorkoutColor = AppColors.contentColorBlue;

  final betweenSpace = 0.2;

  List<BarChartGroupData> generateGroupData(List<WeekData> weekDataList) {
    List<BarChartGroupData> groupDataList = [];

    for (int i = 0; i < weekDataList.length; i++) {
      WeekData weekData = weekDataList[i];
      double tasksAccomplished = weekData.tasksAccomplished.toDouble();
      double tasksCreated = weekData.tasksCreated.toDouble();
      double tasksDeleted = weekData.tasksDeleted.toDouble();

      BarChartGroupData groupData = BarChartGroupData(
        x: i,
        groupVertically: true,
        barRods: [
          BarChartRodData(
            toY: tasksAccomplished,
            color: pilateColor,
            width: 10,
          ),
          BarChartRodData(
            toY: tasksCreated + betweenSpace,
            color: quickWorkoutColor,
            width: 10,
          ),
          BarChartRodData(
            toY: tasksDeleted + betweenSpace,
            color: cyclingColor,
            width: 10,
          ),
        ],
      );

      groupDataList.add(groupData);
    }

    return groupDataList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Activity',
            style: TextStyle(
              color: AppColors.contentColorBlue,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: LegendsListWidget(
              legends: [
                Legend('Task Created', pilateColor),
                Legend('Tasks Deleted', quickWorkoutColor),
                Legend('Tasks Accomplished', cyclingColor),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AspectRatio(
            aspectRatio: 2,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceBetween,
                titlesData: const FlTitlesData(
                  leftTitles: AxisTitles(),
                  rightTitles: AxisTitles(),
                  topTitles: AxisTitles(),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                      // getTitlesWidget:bottomTitles ,
                      reservedSize: 20,
                    ),
                  ),
                ),
                barTouchData: BarTouchData(enabled: false),
                borderData: FlBorderData(show: false),
                gridData: const FlGridData(show: false),
                barGroups: generateGroupData(weekDataList),
                maxY: 11 + (betweenSpace * 3),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 3.3,
                      color: pilateColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 8,
                      color: quickWorkoutColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
                    HorizontalLine(
                      y: 11,
                      color: cyclingColor,
                      strokeWidth: 1,
                      dashArray: [20, 4],
                    ),
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

class LegendWidget extends StatelessWidget {
  const LegendWidget({
    super.key,
    required this.name,
    required this.color,
  });
  final String name;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(width: 6),
        Text(
          name,
          style: const TextStyle(
            color: Color(0xff757391),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

class LegendsListWidget extends StatelessWidget {
  const LegendsListWidget({
    super.key,
    required this.legends,
  });
  final List<Legend> legends;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 16,
      children: legends
          .map(
            (e) => LegendWidget(
              name: e.name,
              color: e.color,
            ),
          )
          .toList(),
    );
  }
}

class Legend {
  Legend(this.name, this.color);
  final String name;
  final Color color;
}
