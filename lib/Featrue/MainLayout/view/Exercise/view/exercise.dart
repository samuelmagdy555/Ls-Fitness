import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/View%20Model/exercises_details_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';
import 'package:number_paginator/number_paginator.dart';

import '../../../../../Core/Constant/Loading Indicator/Loading indecator.dart';
import 'DetailsExercise/view/DetailsExercise.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> buttons = [
    {
      'title': 'Body Parts',
      'choices': <String>[],
    },
    {
      'title': 'Machine',
      'choices': ['Assisted', 'Ball', 'Band', 'Barbell', 'Cable', 'Dumbbell'],
    },
    {
      'title': 'Cardio',
      'choices': ['Assault Bike Run', 'Assault Run', 'Bicycle Recline'],
    },
    {
      'title': 'Warm up',
      'choices': ['Option 4A', 'Option 4B', 'Option 4C'],
    },
    {
      'title': 'Recovery and Stretching',
      'choices': ['Option 5A', 'Option 5B', 'Option 5C'],
    },
    {
      'title': 'Deep Anatomy',
      'choices': ['Biceps', 'Triceps', 'Sternal Head'],
    },
  ];

  late List<String> c;
  int num = 0;
  TabController? tabController;
  late NumberPaginatorController controller;

  @override
  void initState() {
    super.initState();
    c = List<String>.from(buttons[0]['choices']!);
    controller = NumberPaginatorController();
    tabController = TabController(length: 6, vsync: this);
    ExerciseCubit.get(context).getExercise(page: 1);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.sizeOf(context).width;
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: buttons.length,
                itemBuilder: (context, index) {
                  var button = buttons[index];
                  return GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        num = index;
                      });


                      final tapPosition = details.globalPosition;

                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                          tapPosition.dx,
                          tapPosition.dy,
                          tapPosition.dx,
                          tapPosition.dy,
                        ),
                        items: index == 0
                            ? _buildBodyPartsMenu(context)
                            : List<String>.from(buttons[index]['choices']!)
                            .map((choice) {
                          return PopupMenuItem<String>(
                            value: choice,
                            child: Text(choice),
                          );
                        }).toList(),
                      ).then((value) {
                        if (value != null) {
                          print("Selected: $value");
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: num == index
                              ? Colors.deepPurpleAccent
                              : Colors.grey,
                          width: 1,
                        ),
                      ),
                      alignment: Alignment.center,
                      padding:
                      EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        button['title'] as String,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 15),
            BlocConsumer<ExerciseCubit, ExerciseState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                return NumberPaginator(
                  showNextButton: true,
                  showPrevButton: true,
                  controller: controller,
                  numberPages: 10,
                  onPageChange: (int index) =>
                      ExerciseCubit.get(context).changePage(
                          controller: controller, index: index)

                );
              },
            ),
            Expanded(
              child: BlocBuilder<ExerciseCubit, ExerciseState>(
                builder: (context, state) {
                  var exercises = ExerciseCubit
                      .get(context)
                      .exercisesModel
                      ?.data;
                  if (exercises == null || exercises.isEmpty) {
                    return Center(
                      child:MyLoadingIndicator(height: height*.1, color: Colors.deepPurple,)
                    );
                  }
                  return ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return Container(
                        margin: EdgeInsets.all(12),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: .5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExerciseTile(
                          title: exercise.title ?? 'Unknown Title',
                          onPressed: () async {
                            ExercisesDetailsCubit.get(context)
                                .getExercisesDetails(id: exercise.id);
                            ProgressCubit.get(context)
                                .getExercisesProgress(id: exercise.id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ExercisePage(
                                        videoPath: '',
                                        title: exercise.title ?? 'Unknown',
                                      ),
                                ));
                          },
                          imagePath: exercise.video?.thumbnail ?? '',
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuEntry<String>> _buildBodyPartsMenu(BuildContext context) {
    var cubit = ExerciseCubit.get(context);
    var state = cubit.state;

    if (state is BodyPartsLoading) {
      return [
        PopupMenuItem<String>(
          child: Center(child: CircularProgressIndicator()),
        )
      ];
    } else if (state is BodyPartsSuccess) {
      var bodyParts = cubit.bodyPartsModel?.data ?? [];
      if (bodyParts.isEmpty) {
        return [
          PopupMenuItem<String>(
            child: Text("No body parts found"),
          )
        ];
      }
      return bodyParts.map((part) {
        return PopupMenuItem<String>(
          value: part.title ?? '',
          child: Text(part.title ?? 'Unknown Part'),
        );
      }).toList();
    } else if (state is BodyPartsError) {
      return [
        PopupMenuItem<String>(
          child: Text("Error: "),
        )
      ];
    } else {
      return [
        PopupMenuItem<String>(
          child: Center(
            child: Text("Press to Load Body Parts"),
          ),
        )
      ];
    }
  }
}

class ExerciseTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPressed;

  const ExerciseTile({
    required this.imagePath,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Row(
          children: [
            Image.network(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Icon(Icons.play_arrow, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
