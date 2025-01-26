import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/View%20Model/exercises_details_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';
import 'package:number_paginator/number_paginator.dart';
import '../../../../../Core/Constant/Loading Indicator/Loading indecator.dart';
import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../Intro Feature/onboarding/View/Widget/colors.dart';
import 'DetailsExercise/view/DetailsExercise.dart';

class WorkoutScreen extends StatefulWidget {
  final bool? isWormUp;

  final String? bodyPartID;

  WorkoutScreen({this.bodyPartID, this.isWormUp = false});

  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> buttons = [
    {
      'title': 'Machine and Tools',
      'choices': ['Assisted', 'Ball', 'Band', 'Barbell', 'Cable', 'Dumbbell'],
    },
    {
      'title': 'Cardio',
      'choices': ['Assault Bike Run', 'Assault Run', 'Bicycle Recline'],
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
  final List<Map<String, dynamic>> buttons2 = [
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
    if (widget.isWormUp == true) {
      c = List<String>.from(buttons2[0]['choices']!);
    } else {
      c = List<String>.from(buttons[0]['choices']!);
    }

    controller = NumberPaginatorController();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    tabController!.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  void deactivate() {
    super.deactivate();
    final exerciseCubit = ExerciseCubit.get(context);
    exerciseCubit.exercisesModel = null;
    exerciseCubit.filter = [
      6,
      6,
      6,
      6,
    ];
    exerciseCubit.filterDetails = [
      '',
      '',
      '',
      '',
    ];
    exerciseCubit.buttons = [
      'toolOrMachine',
      'Cardio',
      'recoveryAndStretching',
      'deepAnatomy'
    ];
  }

  String selectedTitle = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    final exerciseCubit = ExerciseCubit.get(context);
    final themeCubit = BlocProvider.of<ThemesCubit>(context);
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(

      body: BlocConsumer<ExerciseCubit, ExerciseState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ExerciseCubit.get(context).exercisesModel == null
              ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
                child: Center(
                    child: MyLoadingIndicator(
                    height: height * .1,
                    color: Theme.of(context).primaryColor,
                  )),
              )
              : Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(currentState['backgroundImage']),
                  fit: BoxFit.cover),
            ),
                child: Column(

                    children: [
                      SizedBox(
                        height: height*.05,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          Text(
                            '  Workout',
                            style: Theme.of(context).textTheme.titleLarge)
                        ],
                      ),
                      SizedBox(
                        child: GridView.builder(
                          shrinkWrap: true,
                          padding: EdgeInsets.only(top: 15),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: widget.isWormUp == true ? 1:2 ,
                            childAspectRatio:widget.isWormUp == true ? 5  : 3.2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: widget.isWormUp == true ? buttons2.length : buttons.length,
                          itemBuilder: (context, index) {
                            if (widget.isWormUp == false){
                              var button = buttons[index];
                              return GestureDetector(
                                onTapDown: (TapDownDetails details) async {
                                  setState(() {
                                    if (ExerciseCubit.get(context).filter[index] ==
                                        index) {
                                      ExerciseCubit.get(context).filter[index] = 6;
                                    } else {
                                      ExerciseCubit.get(context).filter[index] =
                                          index;
                                    }
                                  });

                                  if (index == 0) {
                                    if (ExerciseCubit.get(context).filter[index] ==
                                        index) {
                                      await ExerciseCubit.get(context)
                                          .getDeepAnatomyOrTool(index);
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
                                          return PopupMenuItem<
                                              Map<String, dynamic>>(
                                            value: {
                                              'value': choice,
                                              'itemIndex': itemIndex
                                            },
                                            child: Text(
                                              choice,
                                              style: Theme.of(context).textTheme.bodyMedium,
                                            ),
                                          );
                                        }).toList(),
                                      ).then((selected) {
                                        if (selected != null) {
                                          ExerciseCubit.get(context).changePage(
                                              controller: controller, index: 0);
                                          String value = selected['value'];
                                          int itemIndex = selected['itemIndex'];

                                          ExerciseCubit.get(context)
                                              .filterDetails[index] = value;

                                          ExerciseCubit.get(context)
                                              .updateTitleByIndex(
                                              index, itemIndex, buttons);

                                          ExerciseCubit.get(context)
                                              .generateFilterMap(
                                              page: 1, controller: controller);
                                          controller.navigateToPage(0);
                                        }
                                      });
                                    } else {
                                      ExerciseCubit.get(context).generateFilterMap(
                                          page: 1, controller: controller);
                                      ExerciseCubit.get(context).changePage(
                                          controller: controller, index: 0);
                                    }
                                  } else if (index == 3) {
                                    if (widget.isWormUp == true) {
                                      await ExerciseCubit.get(context)
                                          .getBodyParts();
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
                                            .LoadBodyPartItems(index)
                                            .asMap()
                                            .entries
                                            .map((entry) {
                                          int itemIndex = entry.key;
                                          String choice = entry.value;
                                          return PopupMenuItem<
                                              Map<String, dynamic>>(
                                            value: {
                                              'value': choice,
                                              'itemIndex': itemIndex
                                            },
                                            child: Text(
                                              choice,
                                            ),
                                          );
                                        }).toList(),
                                      ).then((selected) {
                                        if (selected != null) {
                                          ExerciseCubit.get(context).changePage(
                                              controller: controller, index: 0);
                                          String value = selected['value'];
                                          int itemIndex = selected['itemIndex'];
                                          print('itemIndex is $itemIndex');
                                          ExerciseCubit.get(context)
                                              .workoutWithBodyPart(
                                              BodyPartId: value,
                                              index: itemIndex);
                                          // ExerciseCubit.get(context)
                                          //     .filterDetails[index] = value;
                                          // //
                                          // ExerciseCubit.get(context)
                                          //     .updateTitleByIndex(
                                          //     index, itemIndex, buttons);
                                          // print('generateFilterMap');
                                          //
                                          // ExerciseCubit.get(context)
                                          //     .generateFilterMap(
                                          //     page: 1, controller: controller);
                                          // controller.navigateToPage(0);
                                        }
                                      });
                                    } else {
                                      if (ExerciseCubit.get(context)
                                          .filter[index] ==
                                          index) {
                                        await ExerciseCubit.get(context)
                                            .getDeepAnatomyForSpecificBodyPart(
                                            id: widget.bodyPartID!);
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
                                              .LoadDeepAnatomyItems(index)
                                              .asMap()
                                              .entries
                                              .map((entry) {
                                            int itemIndex = entry.key;
                                            String choice = entry.value;
                                            return PopupMenuItem<
                                                Map<String, dynamic>>(
                                              value: {
                                                'value': choice,
                                                'itemIndex': itemIndex
                                              },
                                              child: Text(
                                                choice,
                                              ),
                                            );
                                          }).toList(),
                                        ).then((selected) {
                                          if (selected != null) {
                                            ExerciseCubit.get(context).changePage(
                                                controller: controller, index: 0);
                                            String value = selected['value'];
                                            int itemIndex = selected['itemIndex'];

                                            print('filterDetails');
                                            ExerciseCubit.get(context)
                                                .filterDetails[index] = value;
                                            print('updateTitleByIndex');
                                            print(index);
                                            print(itemIndex);
                                            print(buttons);
                                            print('print 3');

                                            ExerciseCubit.get(context)
                                                .updateTitleByIndex(
                                                index, itemIndex, buttons);
                                            print('generateFilterMap');

                                            ExerciseCubit.get(context)
                                                .generateFilterMap(
                                                page: 1,
                                                controller: controller);
                                            controller.navigateToPage(0);
                                          }
                                        });
                                      } else {
                                        ExerciseCubit.get(context)
                                            .generateFilterMap(
                                            page: 1, controller: controller);
                                        ExerciseCubit.get(context).changePage(
                                            controller: controller, index: 0);
                                      }
                                    }
                                  } else {
                                    ExerciseCubit.get(context)
                                        .updateTitleByIndex(index, index, buttons);
                                    ExerciseCubit.get(context).generateFilterMap(
                                        page: 1, controller: controller);
                                    ExerciseCubit.get(context).changePage(
                                        controller: controller, index: 0);
                                  }
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: ExerciseCubit.get(context)
                                          .filter[index] ==
                                          index
                                          ? Theme.of(context).focusColor
                                          : Colors.white30,
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    button['title'] as String,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyMedium
                                  ),
                                ),
                              );
                            }
                            else{
                              var button = buttons2[index];
                              return GestureDetector(
                                onTapDown: (TapDownDetails details) async {
                                  setState(() {
                                    if (ExerciseCubit.get(context).filter[index] ==
                                        index) {
                                      ExerciseCubit.get(context).filter[index] = 6;
                                    } else {
                                      ExerciseCubit.get(context).filter[index] =
                                          index;
                                    }
                                  });
                                  if (ExerciseCubit.get(context)
                                      .filter[index] == index) {
                                    await ExerciseCubit.get(context)
                                        .getBodyParts();
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
                                          .LoadBodyPartItems(index)
                                          .asMap()
                                          .entries
                                          .map((entry) {
                                        int itemIndex = entry.key;
                                        String choice = entry.value;
                                        return PopupMenuItem<
                                            Map<String, dynamic>>(
                                          value: {
                                            'value': choice,
                                            'itemIndex': itemIndex
                                          },
                                          child: Text(
                                            choice,
                                            style: Theme.of(context).textTheme.bodyMedium,
                                          ),
                                        );
                                      }).toList(),
                                    ).then((selected) {
                                      if (selected != null) {
                                        ExerciseCubit.get(context).changePage(
                                            controller: controller, index: 0);
                                        String value = selected['value'];
                                        int itemIndex = selected['itemIndex'];
                                        print('itemIndex is $itemIndex');
                                        ExerciseCubit.get(context)
                                            .workoutWithBodyPart(
                                            BodyPartId: value,
                                            index: itemIndex);


                                      }
                                    });
                                      }
                                  else{

                                    ExerciseCubit.get(context)
                                        .getExercise(query: {"Warmup": "true"});
                                  }

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: ExerciseCubit.get(context)
                                          .filter[index] ==
                                          index
                                          ? Colors.white
                                          : Colors.grey,
                                      width: 2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Text(
                                    button['title'] as String,
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context).textTheme.bodyMedium
                                  )),
                              );
                            }

                          },
                        ),
                      ),
                      SizedBox(height: 15),
                      BlocConsumer<ExerciseCubit, ExerciseState>(
                        listener: (context, state) {},
                        builder: (context, state) {
                          return exerciseCubit.exercisesModel!.data!.isNotEmpty
                              ? NumberPaginator(

                                  showNextButton: true,
                                  showPrevButton: true,
                                  controller: controller,
                                  numberPages: exerciseCubit.exercisesModel
                                          ?.paginationResult.numberOfPages ??
                                      0,
                                  onPageChange: (int index) {
                                    if (widget.isWormUp == true) {
                                      exerciseCubit.getExercise(

                                        query: {
                                          'Warmup': 'true',
                                          'page': index +1
                                        },
                                      );
                                    }
                                    else{
                                      exerciseCubit.changePage(
                                          controller: controller, index: index);
                                      exerciseCubit.generateFilterMap(
                                          page: index + 1, controller: controller);

                                    }
                                  },
                                )
                              : Center(
                                  child: Text(
                                    '',
                                    style: Theme.of(context).textTheme.bodyMedium
                                  ),
                                );
                        },
                      ),
                      Expanded(
                        child: BlocBuilder<ExerciseCubit, ExerciseState>(
                          builder: (context, state) {
                            var exercises =
                                ExerciseCubit.get(context).exercisesModel?.data;

                            return exercises == null
                                ? Center(
                                    child: MyLoadingIndicator(
                                    height: height * .1,
                                    color: Theme.of(context).secondaryHeaderColor,
                                  ))
                                : exercises.isEmpty
                                    ? Center(
                                        child: Text(
                                        'No Exercises',
                                        style: Theme.of(context).textTheme.bodyLarge
                                      ))
                                    : ListView.builder(
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ExerciseTile(
                                              title: exercise.title,
                                              onPressed: () async {
                                                ProgressCubit.get(context)
                                                    .getExercisesProgress(
                                                        id: exercise.id);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          ExercisePage(
                                                        ID: exercise.id,
                                                      ),
                                                    ));
                                              },
                                              imagePath:
                                                  exercise.video?.thumbnail ?? '',
                                            ),
                                          );
                                        },
                                      );
                          },
                        ),
                      ),
                    ],
                  ),
              );
        },
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
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey,

                );
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyMedium
              ),
            ),
            Icon(Icons.play_arrow, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
