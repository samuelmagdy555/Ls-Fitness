import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/MainLayout/view/Exercise/view/DetailsExercise/view/DetailsExercise.dart';
import 'package:video_player/video_player.dart';

class WorkoutScreen extends StatefulWidget {
  @override
  _WorkoutScreenState createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
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

  List<bool> checkedStatus = [];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    checkedStatus = List.generate(exercises.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

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

    return Scaffold(
      backgroundColor: Colors.black,

      body: Stack(
        children:[
          Positioned.fill(
            child: Image.asset(
              'assets/images/dl.beatsnoop.com-high-a99939166bb3d697f8.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Column(
              children: [

                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2,
                  ),
                  itemCount: buttons.length,
                  itemBuilder: (context, index) {
                    final List<String> choices =
                    buttons[index]['choices']! as List<String>;

                    return Padding(
                      padding: EdgeInsets.all(7.0),
                      child: PopupMenuButton<String>(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(22),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                            textStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: null,
                          child: Text(
                            buttons[index]['title']! as String,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onSelected: (String value) {
                          setState(() {
                            selectedValue = value;
                          });
                        },
                        itemBuilder: (BuildContext context) {
                          return choices.map((String choice) {
                            return PopupMenuItem<String>(
                              value: choice,
                              child: Text(
                                choice,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList();
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: screenHeight * 0.10),
                Expanded(
                  child: ListView.builder(
                    itemCount: exercises.length,
                    itemBuilder: (context, index) {
                      final exercise = exercises[index];
                      return Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                value: checkedStatus[index],
                                onChanged: (bool? value) {
                                  setState(() {
                                    checkedStatus[index] = value ?? false;
                                  });
                                },
                              ),
                              Expanded(
                                child: ExerciseTile(
                                  imagePath: exercise.videoPath,
                                  title: exercise.title,
                                  category: exercise.category,
                                  bodyPart: exercise.bodyPart,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ExercisePage(
                                            videoPath: exercise.videoPath, title: exercise.title,),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * .02),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ]

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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: onPressed,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    category,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    bodyPart,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Icon(Icons.play_circle_outline, color: Colors.white),
        ],
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
