/**
 * The LineChart class is used to create the line chart in the words per minute analysis page. We used
 * the FLChart package to help us create this visual.
 *
 * @author Kaushik Indukuri, Yuvraj Khullar, Akhil Giridhar, Derek Xu
 * @version 1.0
*/
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class LineChartSample4 extends StatelessWidget {
  @override
  random(min, max) {
    Random rn = new Random();
    return min + (max - min) * rn.nextDouble();
  }

  Widget build(BuildContext context) {
    const cutOffYValue = 4.0;
    const dateTextStyle = TextStyle(
        fontSize: 10, color: secondaryText, fontWeight: FontWeight.bold);

    return SizedBox(
      width: 400,
      height: 170,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 1),
                FlSpot(1, random(1, 3)),
                FlSpot(2, random(1, 3)),
                FlSpot(3, random(1, 4)),
                FlSpot(4, random(1, 4)),
                FlSpot(5, random(3, 4)),
                FlSpot(6, random(2, 5)),
                FlSpot(7, random(3, 6)),
                FlSpot(8, random(3, 6)),
                FlSpot(9, random(4, 6)),
                FlSpot(10, random(4, 6)),
                FlSpot(11, random(5, 7)),
              ],
              isCurved: true,
              barWidth: 3.5,
              colors: [
                blueText,
              ],
              belowBarData: BarAreaData(
                show: true,
                colors: [Colors.greenAccent.withOpacity(0.45)],
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              aboveBarData: BarAreaData(
                show: true,
                colors: [Colors.redAccent.withOpacity(0.45)],
                cutOffY: cutOffYValue,
                applyCutOffY: true,
              ),
              dotData: FlDotData(
                show: false,
              ),
            ),
          ],
          minY: 0,
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
                margin: 8,
                showTitles: true,
                reservedSize: 14,
                getTextStyles: (value) => dateTextStyle,
                getTitles: (value) {
                  switch (value.toInt()) {
                    case 0:
                      return '';
                    case 1:
                      return '0:05';
                    case 2:
                      return '';
                    case 3:
                      return '0:10';
                    case 4:
                      return '';
                    case 5:
                      return '0:15';
                    case 6:
                      return '';
                    case 7:
                      return '0:20';
                    case 8:
                      return '';
                    case 9:
                      return '0:25';
                    case 10:
                      return '';
                    case 11:
                      return '0:30';
                    default:
                      return '';
                  }
                }),
            leftTitles: SideTitles(
              showTitles: true,
              margin: 9,
              getTextStyles: (value) => dateTextStyle,
              getTitles: (value) {
                return ' ${(value + 12).toInt()}0';
              },
            ),
          ),
          axisTitleData: FlAxisTitleData(
              leftTitle: AxisTitle(
                  showTitle: true,
                  titleText: 'WPM',
                  textStyle: dateTextStyle,
                  margin: 8),
              bottomTitle: AxisTitle(
                  showTitle: true,
                  margin: 0,
                  titleText: 'Time',
                  textStyle: dateTextStyle,
                  textAlign: TextAlign.right)),
          gridData: FlGridData(
            show: true,
            checkToShowHorizontalLine: (double value) {
              return value == 1 ||
                  value == 6 ||
                  value == 4 ||
                  value == 5 ||
                  value == 2 ||
                  value == 3;
            },
          ),
        ),
      ),
    );
  }
}
