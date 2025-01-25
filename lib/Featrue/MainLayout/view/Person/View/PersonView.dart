import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';

import '../../../../../Core/Themes/Themes Cubit/themes_cubit.dart';
import '../../../../../try3.dart';
import '../../Exercise/view/exercise.dart';

class PersonView extends StatefulWidget {
  const PersonView({super.key});

  @override
  State<PersonView> createState() => _PersonViewState();
}

// ignore: camel_case_typessafasd
class _PersonViewState extends State<PersonView>
    with SingleTickerProviderStateMixin {
  bool _isFlipped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
  }

  late double width;
  late double height;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flipImage() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    setState(() {
      _isFlipped = !_isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    final themeCubit = BlocProvider.of<ThemesCubit>(context);
    final currentState = context.watch<ThemesCubit>().state;

    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: FloatingActionButton(
                  onPressed: () {
                    ExerciseCubit.get(context)
                        .getExercise(query: {"Warmup": "true"});
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => WorkoutScreen(
                                  bodyPartID: '',
                              isWormUp: true,
                                )));
                  },
                  child: Icon(Iconsax.tag_right),
                ),
              ),
              Text('WormUP')
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: _flipImage,
                child: Icon(Icons.flip),
              ),
              Text('Flip')
            ],
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(currentState['backgroundImage']),
              fit: BoxFit.cover),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(
              child: AnimatedOpacity(
                opacity: !_isFlipped ? 0 : 1,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/images/Person back.png',
                  width: width * 0.8,
                  height: height * 0.8,
                ),
              ),
            ),
            Center(
              child: AnimatedOpacity(
                opacity: !_isFlipped ? 1 : 0,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/images/Person.jpeg',
                  width: width * 0.8,

                ),
              ),
            ),
            !_isFlipped
                ? Positioned(
                    top: height * .145,
                    right: width * .085,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668d2';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '67399428c913a95d941668d2',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Nick',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandingWave(),
                              Container(
                                width: width * .35,
                                height: height * .006,
                                color:Theme.of(context).secondaryHeaderColor
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                : SizedBox(),
            !_isFlipped
                ? Positioned(
                    top: height * .18,
                    left: width * .0165,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668d3';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '67399428c913a95d941668d3',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'shoulders',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * .27,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                              ExpandingWave(),
                            ],
                          ),
                        ],
                      ),
                    ))
                : Positioned(
                    top: height * .17,
                    left: width * .1,
                    child: GestureDetector(
                      onTap: () {
                        // ExerciseCubit.get(context).result2 = '67399428c913a95d941668d3';
                        // ExerciseCubit.get(context).generateFilterMap();
                        // Navigator.push(context, MaterialPageRoute(builder: (context) =>  WorkoutScreen()));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Trabs',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * .32,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                              ExpandingWave(),
                            ],
                          ),
                        ],
                      ),
                    )),
            !_isFlipped
                ? Positioned(
                    top: height * .215,
                    right: width * .04,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668d0';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '67399428c913a95d941668d0',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Chest',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandingWave(),
                              Container(
                                width: width * .375,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                : Positioned(
                    top: height * .245,
                    left: width * .032,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Lats',
                          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: width * .3,
                              height: height * .006,
                              color: Theme.of(context).secondaryHeaderColor
                            ),
                            ExpandingWave(),
                          ],
                        ),
                      ],
                    )),
            !_isFlipped
                ? Positioned(
                    top: height * .235,
                    left: width * .0125,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '673a542bc913a95d94166edf';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '673a542bc913a95d94166edf',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Biceps',
                            style:Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * .2,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                              ExpandingWave(),
                            ],
                          ),
                        ],
                      ),
                    ))
                : Positioned(
                    top: height * .225,
                    right: width * .015,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668d9';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '67399428c913a95d941668d9',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Triceps',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandingWave(),
                              Container(
                                width: width * .185,
                                height: height * .006,
                                color:Theme.of(context).secondaryHeaderColor
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
            !_isFlipped
                ? Positioned(
                    top: height * .32,
                    left: width * .025,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668d7';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                    bodyPartID: '67399428c913a95d941668d7')));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Forearms',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * .21,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                              ExpandingWave(),
                            ],
                          ),
                        ],
                      ),
                    ))
                : SizedBox(),
            !_isFlipped
                ? Positioned(
                    top: height * .29,
                    right: width * .125,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668dc';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '67399428c913a95d941668dc',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Abs',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandingWave(),
                              Container(
                                width: width * .35,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                : Positioned(
                    top: height * .315,
                    right: width * .03,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '674078d89f0d1eedab574aae';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '674078d89f0d1eedab574aae',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Lower Back',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandingWave(),
                              Container(
                                width: width * .45,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
            !_isFlipped
                ? Positioned(
                    top: height * .45,
                    left: width * .05,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '674078d89f0d1eedab574aae';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '674078d89f0d1eedab574aae',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Adductors',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * .385,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                              ExpandingWave(),
                            ],
                          ),
                        ],
                      ),
                    ))
                : Positioned(
                    top: height * .385,
                    left: width * .02,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '674078d89f0d1eedab574aaa';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '674078d89f0d1eedab574aaa',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Glutes',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * .375,
                                height: height * .006,
                                color:Theme.of(context).secondaryHeaderColor
                              ),
                              ExpandingWave(),
                            ],
                          ),
                        ],
                      ),
                    )),
            !_isFlipped
                ? Positioned(
                    top: height * .5,
                    right: width * .05,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668d5';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '67399428c913a95d941668d5',
                                    )));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Quads',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandingWave(),
                              Container(
                                width: width * .3,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                            ],
                          ),
                        ],
                      ),
                    ))
                : Positioned(
                    top: height * .5,
                    right: width * .02,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668d8';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                    bodyPartID: '67399428c913a95d941668d8')));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Hamstrings',
                            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ExpandingWave(),
                              Container(
                                width: width * .35,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
            _isFlipped
                ? Positioned(
                    top: height * .635,
                    left: width * .01,
                    child: GestureDetector(
                      onTap: () {
                        ExerciseCubit.get(context).result2 =
                            '67399428c913a95d941668db';
                        ExerciseCubit.get(context).generateFilterMap(page: 1);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WorkoutScreen(
                                      bodyPartID: '67399428c913a95d941668db',
                                    )));
                        ////////
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calves',
                            style:Theme.of(context).textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: width * .32,
                                height: height * .006,
                                color: Theme.of(context).secondaryHeaderColor
                              ),
                              ExpandingWave(),
                            ],
                          ),
                        ],
                      ),
                    ))
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
