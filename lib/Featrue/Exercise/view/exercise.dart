// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lsfitness/Featrue/DetailsExercise/view/DetailsExercise.dart';
// import 'package:lsfitness/Featrue/Exercise/viewmodel/exercise_cubit.dart';
// import 'package:lsfitness/Featrue/Filter/view/FiltterPage.dart';
//
// class WorkoutScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//
//     ExerciseCubit.get(context).getExercise();
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: screenHeight * 0.4,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage(
//                           'assets/images/dl.beatsnoop.com-high-a99939166bb3d697f8.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 20,
//                   left: 10,
//                   child: IconButton(
//                     icon: Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed: () {},
//                   ),
//                 ),
//                 Positioned(
//                   top: 20,
//                   right: 10,
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.more_horiz,
//                       color: Colors.white,
//                       size: screenWidth * 0.080,
//                     ),
//                     onPressed: () {},
//                   ),
//                 ),
//                 Positioned(
//                   top: 20,
//                   right: 50,
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.filter_alt_outlined,
//                       color: Colors.white,
//                       size: screenWidth * 0.080,
//                     ),
//                     onPressed: () {
//                       Navigator.push(context,
//                         MaterialPageRoute(builder: (context)=> FilterPage())
//                       );
//                     },
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 20,
//                   left: 0,
//                   right: 0,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Full Body Workout",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         "Exercise 1 of 24",
//                         style: TextStyle(
//                           color: Colors.green,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Expanded(
//               child: BlocConsumer<ExerciseCubit, ExerciseState>(
//                 listener: (context, state) {
//                   if (state is GetExerciseError) {
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(
//                         content: Text('Error loading exercises'),
//                         backgroundColor: Colors.red,
//                       ),
//                     );
//                   }
//                 },
//                 builder: (context, state) {
//                   if (state is GetExerciseLoading) {
//                     return Center(child: CircularProgressIndicator());
//                   } else if (state is GetExerciseError) {
//                     return Center(
//                       child: Text(
//                         'Error loading exercises',
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     );
//                   } else if (state is GetExerciseSuccess &&
//                       ExerciseCubit.get(context).exerciseModel != null) {
//                     final exercises = ExerciseCubit.get(context).exerciseModel!.data;
//
//                     return Container(
//                       decoration: BoxDecoration(
//                         color: Colors.black,
//                         borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(30),
//                           topRight: Radius.circular(30),
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: ListView.builder(
//                           itemCount: exercises.length,
//                           itemBuilder: (context, index) {
//                             final exercise = exercises[index];
//                             return Column(
//                               children: [
//                                 ExerciseTile(
//                                   imagePath: exercise.video.publicId,
//                                   title: exercise.title ?? 'Exercise',
//                                   category: exercise.category.title ?? 'Unknown Category',
//                                   bodyPart: exercise.bodyPart.title?? 'Unknown Body Part',
//                                   onPressed: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => WorkoutDetailsPage(
//                                            id: exercise.video.publicId, videoUrl: exercise.video.url,
//                                         ),
//                                       ),
//                                     );
//                                   },
//                                 ),
//                                 SizedBox(height: screenHeight * .02),
//                               ],
//                             );
//                           },
//                         ),
//                       ),
//                     );
//                   }
//                   return Container();
//                 },
//               ),
//             )
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// class ExerciseTile extends StatefulWidget {
//   final String imagePath;
//   final String title;
//   final String category; // إضافة الـ category
//   final String bodyPart; // إضافة الـ body part
//   final VoidCallback onPressed;
//
//   const ExerciseTile({
//     required this.imagePath,
//     required this.title,
//     required this.category,  // تمرير الـ category
//     required this.bodyPart,  // تمرير الـ body part
//     required this.onPressed,
//   });
//
//   @override
//   _ExerciseTileState createState() => _ExerciseTileState();
// }
//
// class _ExerciseTileState extends State<ExerciseTile> {
//   bool isChecked = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 8.0),
//       child: Row(
//         children: [
//           Checkbox(
//             value: isChecked,
//             onChanged: (bool? newValue) {
//               setState(() {
//                 isChecked = newValue!;
//               });
//             },
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: GestureDetector(
//               onTap: widget.onPressed,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.title,
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   Text(
//                     widget.category,  // عرض الـ category
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                     ),
//                   ),
//                   Text(
//                     widget.bodyPart,  // عرض الـ body part
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 14,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           Icon(Icons.play_circle_outline, color: Colors.white),
//         ],
//       ),
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import 'package:lsfitness/Featrue/Filter/view/FiltterPage.dart';
import 'package:video_player/video_player.dart';  // إضافة مكتبة تشغيل الفيديو

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
      title: 'Barbell JM Bench Press ',
      category: 'barbell',
      bodyPart: 'arms',
    ),
    Exercise(
      videoPath: 'assets/videos/OverheadTricepsExtension.mp4',
      title: 'Overhead Triceps Extension ',
      category: 'arms',
      bodyPart: 'machine',
    ),
    Exercise(
      videoPath: 'assets/videos/BarbellShrug.mp4',
      title: 'Barbell Shrug  ',
      category: 'Leg',
      bodyPart: 'barbell',
    ),
    Exercise(
      videoPath: 'assets/videos/CableUpperChestCrossovers.mp4',
      title: 'Cable Upper Chest Crossovers  ',
      category: 'chest',
      bodyPart: 'machine',
    ),
    Exercise(
      videoPath: 'assets/videos/CableUpperChestCrossovers2.mp4',
      title: 'Cable Upper Chest Crossovers  ',
      category: 'chest',
      bodyPart: 'machine',
    ),
    Exercise(
      videoPath: 'assets/videos/DumbbellReverseGripRow.mp4',
      title: 'Dumbbell Reverse Grip Row  ',
      category: 'Back',
      bodyPart: 'dumbbell',
    ),
    Exercise(
      videoPath: 'assets/videos/DumbbellBentOverRow.mp4',
      title: 'Dumbbell Bent Over Row   ',
      category: 'Back',
      bodyPart: 'dumbbell',
    ),
    Exercise(
      videoPath: 'assets/videos/CableCurl.mp4',
      title: 'Cable Curl  ',
      category: 'Arms',
      bodyPart: 'machine',
    ),
    Exercise(
      videoPath: 'assets/videos/LeverBicepCurl.mp4',
      title: 'Lever Bicep Curl   ',
      category: 'Arms',
      bodyPart: 'machine',
    ),
  ];

  // إضافة قائمة لتتبع حالة كل CheckBox
  List<bool> checkedStatus = [];

  @override
  void initState() {
    super.initState();
    checkedStatus = List.generate(exercises.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: screenHeight * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/dl.beatsnoop.com-high-a99939166bb3d697f8.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 10,
                  child: IconButton(
                    icon: Icon(
                      Icons.more_horiz,
                      color: Colors.white,
                      size: screenWidth * 0.080,
                    ),
                    onPressed: () {},
                  ),
                ),
                Positioned(
                  top: 20,
                  right: 50,
                  child: IconButton(
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: Colors.white,
                      size: screenWidth * 0.080,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FilterPage()));
                    },
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Full Body Workout",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Exercise 1 of 24",
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                                    builder: (context) => VideoPlayerScreen(
                                        videoPath: exercise.videoPath),
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
