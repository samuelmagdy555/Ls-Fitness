import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class Data {
   String? name;
   int? volume ;
   int ? id;

  Data(this.name, this.volume , this.id);
}
class _ProgressScreenState extends State<ProgressScreen> {


  List<Data> exercises = [
    Data('Push Ups', 50 , 1),
    Data('Squats', 80,2),
    Data('Pull Ups', 30,3),
    Data('Deadlifts', 120,4),
    Data('Bench Press', 90,5),
    Data('Lunges', 60,6),
    Data('Bicep Curls', 40,7),
    Data('Tricep Dips', 45,8),
    Data('Leg Press', 100,9),
    Data('Shoulder Press', 70,10),
  ];
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
                child: DropdownButton<String>(
                  dropdownColor: Color(0xFF131429),
                  value: ProgressCubit.get(context).selectedValue,
                  icon:
                      Icon(Icons.arrow_drop_down_outlined, color: Colors.white),
                  underline: SizedBox(),
                  isExpanded: true,
                  hint: Text(
                    "Choose Exercise",
                    style: TextStyle(color: Colors.white),
                  ),
                  items: exercises.map<DropdownMenuItem<String>>((exercise) {
                    return DropdownMenuItem<String>(
                      value: exercise.id.toString(),
                      child: Text(
                        exercise.name!,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {

                      ProgressCubit.get(context).selectedValue = newValue;
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
                          spots: [],
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
                            interval: 5,
                            reservedSize: width*.05,

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
}
