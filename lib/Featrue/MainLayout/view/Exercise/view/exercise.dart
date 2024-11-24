import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      'choices': ['Assisted', 'Ball', 'Band', 'Barbell', 'Cable', 'Dumbbell'],
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
  }
  @override
  void dispose() {

    tabController!.dispose();
    controller.dispose();
    super.dispose();
  }

  String selectedTitle = '';

  @override
  Widget build(BuildContext context) {
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
                    onTapDown: (TapDownDetails details) async {
                      setState(() {
                        if (ExerciseCubit.get(context).filter[index] == index) {
                          ExerciseCubit.get(context).filter[index] = 6;
                        } else {
                          ExerciseCubit.get(context).filter[index] = index;
                        }
                      });

                      if (index == 0 || index == 1 || index == 5) {
                        if (ExerciseCubit.get(context).filter[index] == index) {
                          await ExerciseCubit.get(context).getBodyParts(index);
                          final tapPosition = details.globalPosition;

                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(
                              tapPosition.dx,
                              tapPosition.dy,
                              tapPosition.dx,
                              tapPosition.dy,
                            ),
                            items: ExerciseCubit.get(context)
                                .LoadItems(index)
                                .asMap()
                                .entries
                                .map((entry) {
                              int itemIndex = entry.key;
                              String choice = entry.value;
                              return PopupMenuItem<Map<String, dynamic>>(
                                value: {
                                  'value': choice,
                                  'itemIndex': itemIndex
                                },
                                child: Text(choice),
                              );
                            }).toList(),
                          ).then((selected) {
                            if (selected != null) {
                              ExerciseCubit.get(context)
                                  .changePage(controller: controller, index: 0);
                              String value = selected['value'];
                              int itemIndex = selected['itemIndex'];

                              ExerciseCubit.get(context).filterDetails[index] =
                                  value;

                              ExerciseCubit.get(context).updateTitleByIndex(
                                  index, itemIndex, buttons);

                              ExerciseCubit.get(context)
                                  .generateFilterMap(1, controller);
                              controller.navigateToPage(0);
                            }
                          });
                        } else {
                          ExerciseCubit.get(context)
                              .generateFilterMap(1, controller);
                          ExerciseCubit.get(context)
                              .changePage(controller: controller, index: 0);
                        }
                      } else {
                        ExerciseCubit.get(context)
                            .updateTitleByIndex(index, index, buttons);
                        ExerciseCubit.get(context)
                            .generateFilterMap(1, controller);
                        ExerciseCubit.get(context)
                            .changePage(controller: controller, index: 0);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color:
                              ExerciseCubit.get(context).filter[index] == index
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
                    key:  ValueKey(0) ,
                    controller: controller,
                    numberPages: ExerciseCubit.get(context).exercisesModel?.paginationResult!.numberOfPages??1,
                    onPageChange: (int index) {
                      ExerciseCubit.get(context)
                          .changePage(controller: controller, index: index);

                      ExerciseCubit.get(context)
                          .generateFilterMap(index+1, controller);
                    }) ;
              },
            ),
            Expanded(
              child: BlocBuilder<ExerciseCubit, ExerciseState>(
                builder: (context, state) {
                  var exercises =
                      ExerciseCubit.get(context).exercisesModel?.data;

                    return exercises == null ? Center(
                        child: MyLoadingIndicator(
                      height: height * .1,
                      color: Colors.deepPurple,
                    )):


                    exercises.isEmpty? Center(child: Text('No Exercises' , style:  TextStyle(
                      color: Colors.deepPurple,
                      fontSize: 20

                    ),)): ListView.builder(
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
                          title: exercise.title,
                          onPressed: () async {
                            ExercisesDetailsCubit.get(context)
                                .getExercisesDetails(id: exercise.id);
                            ProgressCubit.get(context)
                                .getExercisesProgress(id: exercise.id);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExercisePage(
                                    videoPath: '',
                                    title: exercise.title,
                                  ),
                                ));
                          },
                          imagePath: exercise.video.thumbnail ?? '',
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
