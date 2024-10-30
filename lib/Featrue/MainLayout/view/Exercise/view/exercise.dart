import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/Model/Exercise%20Details%20Model/Exercise%20Details%20Model.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/View%20Model/exercises_details_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/DetailsExercise.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Home/View/Progress%20Feature/View%20Model/progress_cubit.dart';
import 'package:video_player/video_player.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>
    with SingleTickerProviderStateMixin {
  final buttons = [
    {
      'title': 'Body Parts',
      'choices': [
        'Core',
        'Arms',
        'Back',
        'Chest',
        'Legs',
        'Shoulders',
        'Full Body'
      ]
    },
    {
      'title': 'Machine',
      'choices': ['Assisted', 'Ball', 'Band', 'Barbell', 'Cable', 'Dumbbell']
    },
    {
      'title': 'Cardio',
      'choices': ['Assault Bike Run', 'Assault Run', 'Bicycle Recline']
    },
    {
      'title': 'Warm up',
      'choices': ['Option 4A', 'Option 4B', 'Option 4C']
    },
    {
      'title': 'Recovery and Stretching',
      'choices': ['Option 5A', 'Option 5B', 'Option 5C']
    },
    {
      'title': 'Deep Anatomy',
      'choices': ['Biceps', 'Triceps', 'Sternal Head']
    },
  ];
  late List<String> c;
int num= 0;
  String? selectedValue;
  TabController? tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    c = buttons[0]['choices']! as List<String>;
    tabController = TabController(length: 6, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
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
                  c = buttons[index]['choices']! as List<String>;
                });

                // Get the tap position
                final tapPosition = details.globalPosition;

                // Display the popup menu at the tap position
                showMenu(
                  context: context,
                  position: RelativeRect.fromLTRB(
                    tapPosition.dx,
                    tapPosition.dy,
                    tapPosition.dx,
                    tapPosition.dy,
                  ),
                  items: c.map((String choice) {
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
                    color: num == index ? kSecondColor : Colors.grey,
                    width: 1,
                  ),
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
            Expanded(
              child: ListView.builder(
                itemCount: ExerciseCubit.get(context).exercisesModel?.results,
                itemBuilder: (context, index) {
                  final exercise =
                      ExerciseCubit.get(context).exercisesModel?.data![index];
                  return Container(
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ExerciseTile(
                        title: exercise?.title ?? '',
                        category: exercise?.category.title ?? '',
                        bodyPart: exercise?.bodyPart.title ?? '',
                        onPressed: () async {
                          ExercisesDetailsCubit.get(context)
                              .getExercisesDetails(id: exercise!.id);
                          await ProgressCubit.get(context)
                              .getExercisesProgress(id: exercise.id);
                          ProgressCubit.get(context).generateSpots(
                              ProgressCubit.get(context)
                                      .progressModel
                                      ?.data!
                                      .volumes ??
                                  []);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ExercisePage(
                                      videoPath:
                                          'assets/videos/BarbellJMBenchPress.mp4',
                                      title: exercise?.title ?? '',
                                    )),
                          );
                        },
                        imagePath:
                            'https://cdn.shopify.com/s/files/1/1497/9682/files/2_0f397b69-fbe0-4555-bade-e5b5c2723fc0.jpg?v=1653669602',
                      ));
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
  final String category;
  final String bodyPart;
  final VoidCallback onPressed;

  const ExerciseTile({
    required this.imagePath,
    required this.title,
    required this.category,
    required this.bodyPart,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Row(
          children: [
            Image(
              image: NetworkImage(imagePath),
              width: width * .175,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 7.5,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 2.5,
                      ),
                      Text(
                        category,
                        style: TextStyle(
                          color: kSecondColor.withOpacity(.7),
                          fontSize: 14,
                        ),
                      ),
                      Spacer(
                        flex: 1,
                      ),
                      Text(
                        bodyPart,
                        style: TextStyle(
                          color: kSecondColor.withOpacity(.7),
                          fontSize: 14,
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.keyboard_arrow_right_sharp, color: kSecondColor),
          ],
        ),
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({required this.videoPath});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoPath)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
          _controller.play();
        }
      }).catchError((error) {
        setState(() {
          _isError = true;
        });
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Video Player'),
      ),
      body: Center(
        child: _isError
            ? Text(
                "Error loading video",
                style: TextStyle(color: Colors.white),
              )
            : _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller.value.isPlaying
                ? _controller.pause()
                : _controller.play();
          });
        },
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white10,
        ),
      ),
    );
  }
}
