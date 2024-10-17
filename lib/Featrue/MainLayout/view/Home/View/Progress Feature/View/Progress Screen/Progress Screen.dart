import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';

import '../../../../../../../Intro Feature/onboarding/View/Widget/colors.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class Data {
   String? name;
   List<int>? volume ;
   int ? id;

  Data(this.name, this.volume , this.id);
}
class _ProgressScreenState extends State<ProgressScreen> {


  List<Data> exercises = [
    Data('Push Ups', [100,230, 300 , 400, 470,500] , 1),
    Data('Squats', [150,230, 330 , 450, 420,510] ,2),
    Data('Pull Ups', [70,100, 150 , 120, 125,200] ,3),
    Data('Deadlifts', [130,250, 320 , 300, 350,400] ,4),
    Data('Bench Press', [100,230, 300 , 400, 470,500] ,5),
    Data('Lunges', [150,230, 330 , 450, 420,510] ,6),
    Data('Bicep Curls', [130,250, 320 , 300, 350,400]  ,7),
    Data('Tricep Dips',[150,230, 330 , 450, 420,510],8),
    Data('Leg Press', [120,150, 200 , 220, 300,450] ,9),
  ];

  Data? selectedExercise;

  @override
  void initState() {
    super.initState();
    selectedExercise = exercises[0];
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: height * .2,
                width: width * .4,
                child: DropdownButton<Data>(
                  value: selectedExercise,
                  dropdownColor: kThirdColor,
                  items: exercises.map((Data exercise) {
                    return DropdownMenuItem<Data>(
                      value: exercise,
                      child: Text(exercise.name! , style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (Data? newExercise) {
                    setState(() {
                      selectedExercise = newExercise;
                    });
                  },
                ),

              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: height * .4,
                  width: width*.95,
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
                              colors: [Colors.green, Colors.white],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          dotData: FlDotData(show: false),
                          spots: generateSpots(selectedExercise!.volume!),
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
                            reservedSize: width*.1,

                            showTitles: true,

                            getTitlesWidget: (value, meta) {
                              return Text(
                                value.toInt().toString(),
                                style: TextStyle(
                                    color: Colors.white),
                              );
                            },
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            interval: 10,
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
            ],
          )
        ],
      ),
    );
  }
  List<FlSpot> generateSpots(List<int> volumes) {
    List<FlSpot> spots = [];
    for (int i = 0; i < volumes.length; i++) {
      spots.add(FlSpot(i * 10.0, volumes[i].toDouble())); // X يزيد بمقدار 10 لكل نقطة
    }
    return spots;
  }
}



//DropdownButton<Data>(
//             value: selectedExercise,
//             items: exercises.map((Data exercise) {
//               return DropdownMenuItem<Data>(
//                 value: exercise,
//                 child: Text(exercise.name!),
//               );
//             }).toList(),
//             onChanged: (Data? newExercise) {
//               setState(() {
//                 selectedExercise = newExercise;
//               });
//             },
//           ),
//
//           // الرسم البياني LineChart
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: LineChart(
//                 LineChartData(
//                   borderData: FlBorderData(show: true),
//                   lineBarsData: [
//                     LineChartBarData(
//                       spots: generateSpots(selectedExercise!.volume!),
//                       isCurved: true,
//                       barWidth: 4,
//
//                       dotData: FlDotData(show: true),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
