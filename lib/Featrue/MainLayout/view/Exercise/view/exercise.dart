import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Intro%20Feature/onboarding/View/Widget/colors.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/DetailsExercise.dart';
import 'package:video_player/video_player.dart';

import 'DetailsExercise/widget/Video Widget/videowidget.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen>
    with SingleTickerProviderStateMixin {
  List<String>images=[
    'https://cdn.shopify.com/s/files/1/1497/9682/files/2_0f397b69-fbe0-4555-bade-e5b5c2723fc0.jpg?v=1653669602',
    'https://static.strengthlevel.com/images/exercises/jm-press/jm-press-800.jpg',
    'https://weighttraining.guide/wp-content/uploads/2017/08/seated-dumbbell-overhead-triceps-extension-resized.png',
'https://cdn-0.weighttraining.guide/wp-content/uploads/2016/05/Barbell-Shrug-resized.png?ezimgfmt=ng%3Awebp%2Fngcb4',
'https://i.pinimg.com/736x/fe/4f/5c/fe4f5c248b799c41f82858a40c414fa3.jpg'


  ];
  final List<Exercise> exercises = [
    Exercise(
      videoPath: 'assets/videos/dumbbell_arnold_press.mp4',
      title: 'Dumbbell Arnold Press',
      category: 'Dumbbell',
      bodyPart: 'Shoulder',
    ),
    Exercise(
      videoPath: 'assets/videos/BarbellJMBenchPress.mp4',
      title: 'Barbell JM Bench Press',
      category: 'Barbell',
      bodyPart: 'Arms',
    ),
    Exercise(
      videoPath: 'assets/videos/OverheadTricepsExtension.mp4',
      title: 'Overhead Triceps Extension',
      category: 'Machine',
      bodyPart: 'Arms',
    ),
    Exercise(
      videoPath: 'assets/videos/BarbellShrug.mp4',
      title: 'Barbell Shrug',
      category: 'Barbell',
      bodyPart: 'Legs',
    ),
    Exercise(
      videoPath: 'assets/videos/CableUpperChestCrossovers.mp4',
      title: 'Cable Upper Chest Crossovers',
      category: 'Machine',
      bodyPart: 'Chest',
    ),
  ];
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
  List<bool> checkedStatus = [];
  String? selectedValue;
  TabController? tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    c =  buttons[0]['choices']! as List<String>;
    tabController = TabController(length: 6, vsync: this);
    checkedStatus = List.generate(exercises.length, (index) => false);
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
                itemCount: exercises.length,
                itemBuilder: (context, index) {
                  final exercise = exercises[index];
                  return Container(
                      margin: EdgeInsets.all(12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10),

                      ),
                      child: ExerciseTile(
                        title: exercise.title,
                        category: exercise.category,
                        bodyPart: exercise.bodyPart,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ExercisePage(
                                      videoPath: exercise.videoPath,
                                      title: exercise.title,)
                            ),
                          );
                        },
                        imagePath: images[index],
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

class Exercise {
  final String videoPath;
  final String title;
  final String category;
  final String bodyPart;

  Exercise({
    required this.videoPath,
    required this.title,
    required this.category,
    required this.bodyPart,
  });
}
