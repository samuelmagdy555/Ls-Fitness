import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';

import '../../../../../Exercise/model/ExerciseModel.dart';

class ProgressScreen extends StatefulWidget {
  const ProgressScreen({super.key});

  @override
  State<ProgressScreen> createState() => _ProgressScreenState();
}

class _ProgressScreenState extends State<ProgressScreen> {
  late Data selectedExercise; // تعديل النوع ليكون Data

  @override
  void initState() {
    super.initState();
    // تعيين التمرين الافتراضي
    selectedExercise = ExerciseCubit.get(context).exercisesModel!.data[0];
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<Data> exercises = ExerciseCubit.get(context).exercisesModel!.data;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kThirdColor,
        title: Text(
          "Progress",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: height * .05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: DropdownButton<Data>(
                  style: TextStyle(color: Colors.black),
                  dropdownColor: kThirdColor,
                  value: selectedExercise,
                  items: exercises.map((Data exercise) {
                    return DropdownMenuItem<Data>(
                      value: exercise,
                      child: Text(
                        exercise.title,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  }).toList(),
                  onChanged: (Data? newExercise) async {
                    setState(() {
                      selectedExercise = newExercise!;
                    });
                    await ProgressCubit.get(context)
                        .getExercisesProgress(id: selectedExercise.id!);
                    ProgressCubit.get(context).generateSpots(
                        ProgressCubit.get(context)
                                .progressModel
                                ?.data!
                                .volumes ??
                            []);
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: height * .15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: height * .4,
                  width: width * .95,
                  child: BlocConsumer<ProgressCubit, ProgressState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      return LineChart(
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
                                  colors: [Color(0xFF40D876), Colors.white],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              dotData: FlDotData(show: false),
                              spots: ProgressCubit.get(context).spots,
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
                                interval: 25,
                                reservedSize: width * .075,
                                showTitles: true,
                                minIncluded: true,
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
                                reservedSize: 50,
                                showTitles: true,
                                interval: 20,
                                minIncluded: false,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: TextStyle(color: Colors.white),
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
                      );
                    },
                  )),
            ],
          )
        ],
      ),
    );
  }
}
