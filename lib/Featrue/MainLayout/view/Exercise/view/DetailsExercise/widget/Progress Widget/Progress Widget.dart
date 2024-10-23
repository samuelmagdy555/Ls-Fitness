import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';

import '../Exercise button/Exercise button.dart';

class ProgressWidget extends StatelessWidget {
  ProgressWidget({super.key});

  final List<int> volume = [130, 250, 320, 300, 350, 400];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Text(
          'Add your Reps & your Sets to track your progress',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
        SizedBox(
          height: height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                  height: height * .3,
                  child: LineChart(
                    LineChartData(
                      baselineX: 0,
                      baselineY: 0,
                      gridData: FlGridData(
                        show: false,
                      ),
                      lineBarsData: [
                        LineChartBarData(
                          color: Colors.transparent,
                          belowBarData: BarAreaData(
                            show: true,
                            gradient: LinearGradient(
                              colors: [kSecondColor, Colors.white],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          dotData: FlDotData(show: false),
                          spots: generateSpots(volume),
                          isCurved: true,
                          barWidth: 2,
                        )
                      ],
                      lineTouchData: LineTouchData(
                        enabled: false,
                      ),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                            interval: 50,
                            reservedSize: width * .07,
                            showTitles: true,
                            minIncluded: false,
                            maxIncluded: false,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: TextStyle(color: Colors.white),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
                            minIncluded: false,
                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                    color: Colors.white), // تحديد اللون الأبيض
                              );
                            },
                          ),
                        ),
                        topTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        rightTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                      ),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    ),
                  )),
            ),
          ],
        ),
        SizedBox(
          height: height * .05,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kSecondColor),
              ),
              child: CupertinoTextFormFieldRow(
                keyboardType: TextInputType.number,
                placeholder: 'Weight',
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                placeholderStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            Container(
              width: width * .3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: kSecondColor),
              ),
              child: CupertinoTextFormFieldRow(
                keyboardType: TextInputType.number,
                placeholder: 'Reps',
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
                placeholderStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height*.05),
        Row(
          children: [
            Expanded(child: ExerciseButton(label: 'Add',)),
          ],
        )
      ],
    );
  }

  List<FlSpot> generateSpots(List<int> volumes) {
    List<FlSpot> spots = [];
    for (int i = 0; i < volumes.length; i++) {
      spots.add(
          FlSpot(i * 10.0, volumes[i].toDouble())); // X يزيد بمقدار 10 لكل نقطة
    }
    return spots;
  }
}
