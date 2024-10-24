import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/Model/Exercise%20Details%20Model/Exercise%20Details%20Model.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/View%20Model/exercises_details_cubit.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/DetailsExercise.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/viewmodel/exercise_cubit.dart';
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
late List<String>c ;
  String? selectedValue;
  TabController? tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    c =  buttons[0]['choices']! as List<String>;
    tabController = TabController(length: 6, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
       return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(

              children: [
                Expanded(
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                    padding: EdgeInsets.only(top: 15),
                    dividerHeight:  .25,
                    indicatorPadding: EdgeInsets.zero,
                    splashFactory: NoSplash.splashFactory,
                    dividerColor: kSecondColor,
                    controller: tabController,
                    isScrollable: true,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.transparent,
                    ),
                    labelColor: Colors.transparent,
                    unselectedLabelColor: Colors.white,
                    onTap: (index) {
                      setState(() {
                         c =
                        buttons[index]['choices']! as List<String>;

                        tabController?.index = index; // Update the selected tab
                      });
                    },
                    tabs: buttons
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      var button = entry.value;

                      bool isSelected = tabController?.index == index;

                      return Tab(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16 , vertical: 5),
                          // Padding inside the tab
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // Rounded border for each tab
                            border: Border.all(
                              color: isSelected ? kSecondColor : Colors
                                  .transparent,
                              width: .5,
                            ),
                          ),
                          child: Text(
                            button['title'] as String,
                            style: TextStyle(
                              fontSize: 16,
                              color: isSelected ? kSecondColor : Colors
                                  .white, // Text color based on selection
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  width: 5,
                ),

                PopupMenuButton<String>(
                  icon: Icon(Icons.filter_list_alt, color: kSecondColor, size: 30,), // استبدل `kSecondColor` باللون المناسب
                  onSelected: (String value) {
                    print("Selected: $value");
                  },
                  itemBuilder: (BuildContext context) {
                    return c.map((String choice) {
                      return PopupMenuItem<String>(
                        value: choice,
                        child: Text(choice),
                      );
                    }).toList();
                  },
                )
              ],
            ),
            SizedBox(
              height: 15
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ExerciseCubit.get(context).exercisesModel?.results,
                itemBuilder: (context, index) {
                  final exercise = ExerciseCubit.get(context).exercisesModel?.data![index];
                  return Container(
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: ExerciseTile(
                        title: exercise?.title??'',
                        category: exercise?.category.title??'',
                        bodyPart: exercise?.bodyPart.title??'',
                        onPressed: () {
                          ExercisesDetailsCubit.get(context).getExercisesDetails(id: exercise!.id);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExercisePage(
                                      videoPath: exercise?.videoUrl??'',
                                      title: exercise?.title??'',)
                            ),
                          );
                        },
                        imagePath: 'https://cdn.shopify.com/s/files/1/1497/9682/files/2_0f397b69-fbe0-4555-bade-e5b5c2723fc0.jpg?v=1653669602',
                      )
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
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
        child: Row(
          children: [
            Image(image: NetworkImage(imagePath),
            width: width*.175,),
      SizedBox(width: 10,),
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

